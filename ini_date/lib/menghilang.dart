import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class Menghilang with ChangeNotifier {
  DateTime? hari;
  TextEditingController isi = TextEditingController();

  List<DateTime> _mydata = [];
  List<DateTime> get mydata {
    return [..._mydata];
  }

  Future<void> submittap(BuildContext context) async {
    final choices = await showDatePicker(
      context: context,
      firstDate: DateTime(1),
      lastDate: DateTime(3000),
      initialDate: DateTime.now(),
    );

    if (choices != null) {
      hari = choices;
      isi.text =
          "${choices.day.toString().padLeft(2, '0')}-"
          "${choices.month.toString().padLeft(2, '0')}-"
          "${choices.year}";
    }
    notifyListeners();
  }

  Future<void> create() async {
    if (isi.text.trim().isNotEmpty) {
      _mydata.add(hari!);
      save();
      isi.clear();
      hari = null;
    }
    notifyListeners();
  }

  Future<void> delete(int index) async {
    _mydata.removeAt(index);
    save();
    notifyListeners();
  }

  Future<void> update(int index) async {
    if (isi.text.trim().isNotEmpty) {
      final DateTime? hola = DateFormat(
        'dd-MM-yyyy',
      ).parseStrict(isi.text.trim());
      if (hola != null) {
        _mydata[index] = hola;
        save();
        isi.clear();
        hari = null;
      }
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> save() async {
    SharedPreferences sementara = await SharedPreferences.getInstance();
    List<String>? halo = _mydata.map((e) => e.toIso8601String()).toList();
    sementara.setStringList('halo', halo);
  }

  Future<void> load() async {
    SharedPreferences sementara = await SharedPreferences.getInstance();
    List<String>? waktu = sementara.getStringList('halo');
    if (waktu != null) {
      _mydata = waktu.map((e) => DateTime.parse((e))).toList();
    }
    notifyListeners();
  }

  Menghilang() {
    load();
  }
}
