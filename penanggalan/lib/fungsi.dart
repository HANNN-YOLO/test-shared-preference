import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Fungsi with ChangeNotifier {
  DateTime? tanggalnya;
  TextEditingController isilah = TextEditingController();

  List<DateTime> _dumydata = [];
  List<DateTime> get dumydata {
    return [..._dumydata];
  }

  Future<void> call(BuildContext context) async {
    final hand = await showDatePicker(
      context: context,
      firstDate: DateTime(1),
      lastDate: DateTime(3000),
      initialDate: DateTime.now(),
    );
    if (hand != null) {
      tanggalnya = hand;
      isilah.text =
          "${hand.day.toString().padLeft(2, '0')}- "
          "${hand.month.toString().padLeft(2, '0')}- "
          "${hand.year}";
    }
    notifyListeners();
  }

  Future<void> create() async {
    if (isilah.text.trim().isNotEmpty) {
      _dumydata.add(tanggalnya!);
      save();
      isilah.clear();
      tanggalnya = null;
    }
    notifyListeners();
  }

  Future<void> save() async {
    SharedPreferences me = await SharedPreferences.getInstance();
    List<String>? harapan = _dumydata.map((e) => e.toIso8601String()).toList();
    await me.setStringList('harapan', harapan);
  }

  Future<void> load() async {
    SharedPreferences me = await SharedPreferences.getInstance();
    List<String>? done = me.getStringList('harapan');
    if (done != null) {
      _dumydata = done.map((e) => DateTime.parse(e)).toList();
    }
    notifyListeners();
  }

  Fungsi() {
    load();
  }
}
