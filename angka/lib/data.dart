import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data with ChangeNotifier {
  int? bilangan;
  TextEditingController isi = TextEditingController();

  List<int> _dummydata = [];
  List<int> get dumydata {
    return [..._dummydata];
  }

  void terisi() {
    final ada = int.parse(isi.text.trim());
    if (ada != "") {
      bilangan = ada;
    }
    notifyListeners();
  }

  void create() {
    if (isi.text.trim().isNotEmpty) {
      terisi();
      _dummydata.add(bilangan!);
      save();
      isi.clear();
    }
    notifyListeners();
  }

  void delete(int index) async {
    _dummydata.removeAt(index);
    save();
    notifyListeners();
  }

  void update(int index) async {
    final text = int.parse(isi.text.trim());
    if (text != "") {
      terisi();
      _dummydata[index] = text;
      save();
      isi.clear();
    }
    notifyListeners();
  }

  Future<void> save() async {
    SharedPreferences dongo = await SharedPreferences.getInstance();
    await dongo.setString('dumydata', jsonEncode(_dummydata));
  }

  Future<void> load() async {
    SharedPreferences dongo = await SharedPreferences.getInstance();
    String? ambil = dongo.getString('dumydata');
    if (ambil != null) {
      _dummydata = List<int>.from(jsonDecode(ambil));
    }
  }

  Data() {
    _init();
  }

  Future<void> _init() async {
    await load();
  }
}
