import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tugas with ChangeNotifier {
  String? nama;
  TextEditingController siapa = TextEditingController();

  List<String> _siapasaja = [];
  List<String> get siapasaja {
    return [..._siapasaja];
  }

  void isi() {
    final ketikan = siapa.text.trim();
    if (ketikan.isNotEmpty) {
      nama = ketikan;
    }
    notifyListeners();
  }

  void button() {
    if (siapa.text.trim().isNotEmpty) {
      isi();
      _siapasaja.add(nama ?? "");
      save();
      siapa.clear();
    }
    notifyListeners();
  }

  void update(int i) {
    if (siapa.text.trim().isNotEmpty) {
      _siapasaja[i] = siapa.text.trim();
      save();
      siapa.clear();
    }
    notifyListeners();
  }

  Future<void> save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('siapasaja', jsonEncode(_siapasaja));
  }

  Future<void> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? halo = prefs.getString('siapasaja');
    if (halo != null) {
      _siapasaja = List<String>.from(jsonDecode(halo));
    }
    notifyListeners();
  }

  void delete(int i) async {
    _siapasaja.removeAt(i);
    save();
    notifyListeners();
  }

  Tugas() {
    _init();
  }

  Future<void> _init() async {
    await load();
  }
}
