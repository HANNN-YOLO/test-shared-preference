import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Models with ChangeNotifier {
  DateTime? tgl;
  TextEditingController ini = TextEditingController();

  List<DateTime> _sehari = [];
  List<DateTime> get sehari {
    return [..._sehari];
  }

  Future<void> pengisian(BuildContext context) async {
    final choices = await showDatePicker(
      context: context,
      firstDate: DateTime(1),
      lastDate: DateTime(3000),
      initialDate: DateTime.now(),
    );

    if (choices != null) {
      tgl = choices;
      ini.text =
          "${choices.day.toString().padLeft(2, '0')}-"
          "${choices.month.toString().padLeft(2, '0')}-"
          "${choices.year}";
    }
    notifyListeners();
  }

  Future<void> kirim() async {
    if (ini.text.trim().isNotEmpty) {
      _sehari.add(tgl!);
      await simpan();
      ini.clear();
      tgl = null;
    }
    notifyListeners();
  }

  Future<void> simpan() async {
    SharedPreferences yaitu = await SharedPreferences.getInstance();
    List<String>? Sementara = _sehari.map((e) => e.toIso8601String()).toList();
    await yaitu.setStringList('sementara', Sementara);
  }

  Future<void> ambil() async {
    SharedPreferences yaitu = await SharedPreferences.getInstance();
    List<String>? sudah = yaitu.getStringList('sementara');
    if (sudah != null) {
      _sehari = sudah.map((e) => DateTime.parse((e))).toList();
    }
    notifyListeners();
  }

  Models() {
    ambil();
  }
}
