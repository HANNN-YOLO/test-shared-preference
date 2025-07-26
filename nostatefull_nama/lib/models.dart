import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Models with ChangeNotifier {
  String? nama;
  String? namaku;
  TextEditingController namaewa = TextEditingController();

  List<String> _name = [];
  List<String> get name {
    return [..._name];
  }

  void ketikan() {
    final kotak = namaewa.text.trim();
    if (kotak.isNotEmpty) {
      nama = kotak;
      namaku = nama;
      // namaewa.clear();
      notifyListeners();
    }
  }

  void button() {
    if (namaewa.text.trim().isNotEmpty) {
      ketikan();
      _name.add(namaku ?? '');
      namaewa.clear();
      notifyListeners();
    }
  }

  Future<void> simpan() async {
    SharedPreferences me = await SharedPreferences.getInstance();
    await me.setString('name', jsonEncode(_name));
  }

  Future<void> history() async {
    SharedPreferences me = await SharedPreferences.getInstance();
    String? isi = me.getString('name');
    if (isi != null) {
      _name = List<String>.from(jsonDecode(isi));
    }
    notifyListeners();
  }

  void hapus(int index) async {
    _name.removeAt(index);
    await simpan();
    notifyListeners();
  }

  Models() {
    _init();
  }

  Future<void> _init() async {
    await history();
  }
}
