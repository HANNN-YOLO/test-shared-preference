import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Models with ChangeNotifier {
  int? angka;
  TextEditingController bilangan = TextEditingController();

  List<int> _dumydata = [];
  List<int> get dumydata {
    return [..._dumydata];
  }

  void isian() {
    final isi = int.tryParse(bilangan.text.trim());
    if (isi != 0) {
      angka = isi;
    }
    notifyListeners();
  }

  void tombol() async {
    if (bilangan.text.trim().isNotEmpty) {
      isian();
      _dumydata.add(angka ?? 0);
      save();
      bilangan.clear();
    }
    notifyListeners();
  }

  void delete(int index) async {
    _dumydata.removeAt(index);
    save();
    notifyListeners();
  }

  void update(int index) async {
    if (bilangan.text.trim().isNotEmpty) {
      final int? we = int.parse(bilangan.text.trim());
      if (we != null) {
        _dumydata[index] = we;
        save();
        bilangan.clear();
      }
    }
    notifyListeners();
  }

  Future<void> save() async {
    SharedPreferences onpres = await SharedPreferences.getInstance();
    await onpres.setString('dumydata', jsonEncode(_dumydata));
    // await onpres.setInt('dumydata', jsonEncode(_dumydata));
  }

  Future<void> load() async {
    SharedPreferences onpres = await SharedPreferences.getInstance();
    String? nilai = onpres.getString('dumydata');
    if (nilai != null) {
      _dumydata = List<int>.from(jsonDecode(nilai));
    }
    notifyListeners();
  }

  Models() {
    _init();
  }

  Future<void> _init() async {
    await load();
  }
}
