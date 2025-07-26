import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Fungsi with ChangeNotifier {
  DateTime? era;
  TextEditingController hola = TextEditingController();

  List<DateTime> _halo = [];
  List<DateTime> get halo {
    return [..._halo];
  }

  Future<void> bangunan(BuildContext context) async {
    Navigator.of(context).push(
      showPicker(
        context: context,
        value: Time(hour: DateTime.now().hour, minute: DateTime.now().minute),
        onChange: (Time? what) {
          if (what != null) {
            final eze = DateTime.now();
            this.era = DateTime(
              eze.year,
              eze.month,
              eze.day,
              what.hour,
              what.minute,
            );
            hola.text =
                "${what.hour.toString().padLeft(2, '0')}:${what.minute.toString().padLeft(2, '0')}";
          }
        },
        is24HrFormat: true,
        iosStylePicker: true,
        accentColor: Colors.cyan,
      ),
    );
    notifyListeners();
  }

  Future<void> buat() async {
    if (hola.text.trim().isNotEmpty) {
      _halo.add(era!);
      simpan();
      hola.clear();
      era = null;
    }
    notifyListeners();
  }

  Future<void> hapus(int index) async {
    _halo.removeAt(index);
    simpan();
    notifyListeners();
  }

  Future<void> update(int index) async {
    final isi = hola.text.trim();
    if (isi.isNotEmpty) {
      final gabungan = isi.split(":");
      final jam = int.parse(gabungan[0]);
      final menit = int.parse(gabungan[1]);
      if (jam != null && menit != null) {
        final my = DateTime.now();
        _halo[index] = DateTime(my.year, my.month, my.day, jam, menit);
        simpan();
        hola.clear();
        era = null;
      }
    }
    notifyListeners();
  }

  Future<void> simpan() async {
    SharedPreferences walawe = await SharedPreferences.getInstance();
    List<String>? waduh = _halo.map((e) => e.toIso8601String()).toList();
    await walawe.setStringList('waduh', waduh);
  }

  Future<void> ammbil() async {
    SharedPreferences walawe = await SharedPreferences.getInstance();
    List<String>? aduhai = walawe.getStringList('waduh');
    if (aduhai != null) {
      _halo = aduhai.map((e) => DateTime.parse(e)).toList();
    }
    notifyListeners();
  }

  Fungsi() {
    ammbil();
  }
}
