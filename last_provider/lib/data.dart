import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data with ChangeNotifier {
  String? nama;
  String? namaku;

  TextEditingController namaewa = TextEditingController();

  List<String> _name = [];
  List<String> get name {
    return [..._name];
  }

  List<String> _hasil = [];
  List<String> get hasil {
    return [..._hasil];
  }

  void call() {
    final editan = namaewa.text.trim();
    if (editan != "") {
      nama = editan;
      namaku = nama;
      namaewa.clear();
    } else {
      nama = null;
      namaewa.clear();
    }
    notifyListeners();
  }

  void button() {
    if (namaewa.text.trim().isNotEmpty) {
      call();
      // namaewa.clear();
      _name.add(namaku ?? "");
      viewcreate();
      notifyListeners();
    } else {
      null;
    }
  }

  void hapus(int index) async {
    _name.removeAt(index);
    await viewcreate();
    _hasil = _name;
    notifyListeners();
  }

  Future<void> viewcreate() async {
    SharedPreferences ana = await SharedPreferences.getInstance();
    ana.setString('name', jsonEncode(_name));
    // notifyListeners();
  }

  Future<void> storecreate() async {
    SharedPreferences ana = await SharedPreferences.getInstance();
    _name = List<String>.from(jsonDecode(ana.getString('name') ?? '[]'));
    if (name != '') {
      _hasil = _name;
    }
    notifyListeners();
  }

  Data() {
    _init();
  }

  Future<void> _init() async {
    await storecreate();
  }
}
