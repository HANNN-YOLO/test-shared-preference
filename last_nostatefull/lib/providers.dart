import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Providers with ChangeNotifier {
  String? nama;
  int? nim;
  String? savename;
  int? savenim;
  String? ttl;
  String? savettl;

  TextEditingController editan = TextEditingController();
  TextEditingController nomor = TextEditingController();
  TextEditingController tgl = TextEditingController();

  List<String> _riwayat1 = [];
  List<String> get riwayat1 {
    return [..._riwayat1];
  }

  List<String> _riwayat3 = [];
  List<String> get riwayat3 {
    return [..._riwayat3];
  }

  List<String> _data = [];
  List<String> get data {
    return [..._data];
  }

  List<int> _angka = [];
  List<int> get angka {
    return [..._angka];
  }

  List<String> _gabung = [];
  List<String> get gabung {
    return [..._gabung];
  }

  void simpannama() {
    final name = editan.text.trim();
    if (name != "") {
      nama = name;
      savename = nama;
      editan.clear();
    } else {
      savename = null;
      editan.clear();
    }
    notifyListeners();
  }

  void simpanangka() {
    final stb = nomor.text.trim();
    final ubah = int.parse(stb);
    if (ubah != 0) {
      nim = ubah;
      savenim = ubah;
      nomor.clear();
    } else {
      nim = 0;
      nomor.clear();
    }
    notifyListeners();
  }

  String formatTanggal(String isoString) {
    try {
      final date = DateTime.parse(isoString);
      return DateFormat('dd MMM yyyy').format(date);
    } catch (e) {
      return isoString; // Jika parsing gagal, kembalikan string asli
    }
  }

  void simpantgl() {
    final isi = tgl.text.trim();
    if (isi.isNotEmpty) {
      ttl = isi;
      savettl = ttl;
      tgl.clear();
    } else {
      ttl = null;
      tgl.clear();
    }
    notifyListeners();
  }

  void simpangnama() {
    if (editan.text.trim().isNotEmpty) {
      simpannama();
      _data.add(savename ?? "");
      menyimpannama();
    } else {
      null;
    }
    notifyListeners();
  }

  void simpangangka() {
    if (nomor.text.trim().isNotEmpty) {
      simpanangka();
      _angka.add(savenim ?? 0);
      menyimpanangka();
    } else {
      null;
    }
  }

  void simpangtgl() {
    if (tgl.text.trim().isNotEmpty) {
      simpantgl();
      _gabung.add(savettl ?? "");
      menyimpanttl();
    } else {
      null;
    }
    notifyListeners();
  }

  void remove(int index) async {
    _data.removeAt(index);
    _angka.removeAt(index);
    _gabung.removeAt(index);
    await menyimpannama();
    await menyimpanangka();
    await menyimpanttl();
    notifyListeners();
  }

  Future<void> menyimpannama() async {
    SharedPreferences halo = await SharedPreferences.getInstance();
    halo.setString('data', json.encode(data));
  }

  Future<void> mengambilnama() async {
    SharedPreferences halo = await SharedPreferences.getInstance();
    _data = List<String>.from(jsonDecode(halo.getString('data') ?? '[]'));
    if (data != null) {
      _riwayat1 = _data;
      notifyListeners();
    }
  }

  Future<void> menyimpanangka() async {
    SharedPreferences number = await SharedPreferences.getInstance();
    number.setString('number', jsonEncode(_angka));
  }

  Future<void> mengambilangka() async {
    SharedPreferences number = await SharedPreferences.getInstance();
    _angka = List<int>.from(jsonDecode(number.getString('number') ?? '[]'));
    notifyListeners();
  }

  Future<void> menyimpanttl() async {
    SharedPreferences gabungan = await SharedPreferences.getInstance();
    gabungan.setString('gabung', jsonEncode(_gabung));
  }

  Future<void> mengambilttl() async {
    SharedPreferences gabung = await SharedPreferences.getInstance();
    _gabung = List<String>.from(jsonDecode(gabung.getString('gabung') ?? '[]'));
    if (gabung != null) {
      _riwayat3 = _gabung;
      notifyListeners();
    }
  }

  Providers() {
    _init();
  }

  Future<void> _init() async {
    await mengambilnama();
    await mengambilangka();
    await mengambilttl();
  }
}
