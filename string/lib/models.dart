import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Models with ChangeNotifier {
  String? huruf;
  TextEditingController mengapa = TextEditingController();

  List<String> _mydata = [];
  List<String> get mydata {
    return [..._mydata];
  }

  void panggil() {
    final kenapa = mengapa.text.trim();
    if (kenapa.isNotEmpty) {
      huruf = kenapa;
    }
    notifyListeners();
  }

  void create() async {
    if (mengapa.text.trim().isNotEmpty) {
      panggil();
      _mydata.add(huruf ?? "");
      save();
      mengapa.clear();
    }
    notifyListeners();
  }

  void delete(int index) async {
    _mydata.removeAt(index);
    save();
    notifyListeners();
  }

  void update(int index) async {
    if (mengapa.text.trim().isNotEmpty) {
      _mydata[index] = mengapa.text.trim();
      save();
      mengapa.clear();
    }
    notifyListeners();
  }

  Future<void> save() async {
    SharedPreferences simpan = await SharedPreferences.getInstance();
    await simpan.setString('mydata', jsonEncode(_mydata));
  }

  Future<void> load() async {
    SharedPreferences simpan = await SharedPreferences.getInstance();
    String? loading = simpan.getString('mydata');
    if (loading != null) {
      _mydata = List<String>.from(jsonDecode(loading));
    }
    notifyListeners();
  }

  Models() {
    _aku();
  }

  Future<void> _aku() async {
    await load();
  }
}
