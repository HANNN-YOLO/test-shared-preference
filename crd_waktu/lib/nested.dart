import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Nested with ChangeNotifier {
  DateTime? clock;
  TextEditingController jam = TextEditingController();

  List<DateTime> _isi = [];
  List<DateTime> get isi {
    return [..._isi];
  }

  Future<void> build(BuildContext context) async {
    Navigator.of(context).push(
      showPicker(
        context: context,
        value: Time(hour: DateTime.now().hour, minute: DateTime.now().minute),
        onChange: (Time? pilihan) {
          if (pilihan != null) {
            final choices = DateTime.now();
            this.clock = DateTime(
              choices.year,
              choices.month,
              choices.day,
              pilihan.hour,
              pilihan.minute,
            );
            jam.text =
                "${pilihan.hour.toString().padLeft(2, '0')}:${pilihan.minute.toString().padLeft(2, '0')}";
          }
        },
        is24HrFormat: true,
        iosStylePicker: true,
        accentColor: Colors.cyan,
      ),
    );
    notifyListeners();
  }

  void create() {
    if (jam.text.trim().isNotEmpty) {
      _isi.add(clock!);
      save();
      jam.clear();
      clock = null;
    }
    notifyListeners();
  }

  void delete(int index) {
    _isi.removeAt(index);
    save();
    notifyListeners();
  }

  Future<void> update(int index) async {
    final what = jam.text.trim();
    if (what.isEmpty) return;
    final adadua = what.split(":");
    if (adadua.length == 2) {
      final inihour = int.parse(adadua[0]);
      final iniminute = int.parse(adadua[1]);
      if (inihour != null && iniminute != null) {
        final asli = _isi[index];
        _isi[index] = DateTime(
          asli.year,
          asli.month,
          asli.day,
          inihour,
          iniminute,
        );
        save();
        jam.clear();
        clock = null;
      }
    }
    notifyListeners();
  }

  Future<void> backormalas(BuildContext context) async {
    final happen = jam.text.trim();
    if (happen.isNotEmpty) {
      jam.clear();
      clock = null;
      Navigator.of(context).pop();
    }
    notifyListeners();
  }

  Future<void> save() async {
    SharedPreferences me = await SharedPreferences.getInstance();
    List<String>? sementara = _isi.map((e) => e.toIso8601String()).toList();
    await me.setStringList('sementara', sementara);
  }

  Future<void> read() async {
    SharedPreferences me = await SharedPreferences.getInstance();
    List<String>? follow = me.getStringList('sementara');
    if (follow != null) {
      _isi = follow.map((e) => DateTime.parse(e)).toList();
    }
    notifyListeners();
  }

  Nested() {
    read();
  }
}
