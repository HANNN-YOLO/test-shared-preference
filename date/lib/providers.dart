import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Providers with ChangeNotifier {
  DateTime? tanggal;
  TextEditingController hari = TextEditingController();

  List<DateTime> _date = [];
  List<DateTime> get date {
    return [..._date];
  }

  Future<void> call(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());

    final pilih = await showDatePicker(
      context: context,
      firstDate: DateTime(1),
      lastDate: DateTime(3000),
      initialDate: DateTime.now(),
    );

    if (pilih != null) {
      tanggal = pilih;
      hari.text =
          "${pilih.day.toString().padLeft(2, '0')}-"
          "${pilih.month.toString().padLeft(2, '0')}-"
          "${pilih.year}";
    }
    notifyListeners();
  }

  Future<void> create(BuildContext contex) async {
    if (hari.text.trim().isNotEmpty) {
      _date.add(tanggal!);
      await save();
      hari.clear();
      tanggal = null;
    }
    notifyListeners();
  }

  Future<void> save() async {
    SharedPreferences ismi = await SharedPreferences.getInstance();
    List<String> ini = _date.map((e) => e.toIso8601String()).toList();
    await ismi.setStringList('ini', ini);
  }

  Future<void> load() async {
    SharedPreferences ismi = await SharedPreferences.getInstance();
    List<String>? hola = ismi.getStringList('ini');
    if (hola != null) {
      _date = hola.map((e) => DateTime.parse(e)).toList();
    }
    notifyListeners();
  }

  Providers() {
    load(); // Langsung load saat inisialisasi
  }
}
