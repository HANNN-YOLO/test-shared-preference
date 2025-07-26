import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Fungsi with ChangeNotifier {
  String? nama;
  TextEditingController kimi = TextEditingController();

  List<String> _name = [];
  List<String> get name {
    return [..._name];
  }

  void call() {
    final isi = kimi.text.trim();
    if (isi.isNotEmpty) {
      nama = isi;
      notifyListeners();
    }
  }

  void pencet() {
    if (kimi.text.trim().isNotEmpty) {
      call();
      _name.add(nama ?? '');
      simpan();
      kimi.clear();
      notifyListeners();
    }
  }

  Future<void> simpan() async {
    SharedPreferences ana = await SharedPreferences.getInstance();
    await ana.setString('name', jsonEncode(_name));
  }

  Future<void> ambil() async {
    SharedPreferences ana = await SharedPreferences.getInstance();
    String? me = ana.getString('name');
    if (me != null) {
      // ana = List<String>.from(jsonEncode(me));
      _name = List<String>.from(jsonDecode(me));
      notifyListeners();
    }
  }

  void hapus(int index) async {
    _name.removeAt(index);
    simpan();
    notifyListeners();
  }

  Fungsi() {
    _init();
  }

  Future<void> _init() async {
    await ambil();
  }
}
