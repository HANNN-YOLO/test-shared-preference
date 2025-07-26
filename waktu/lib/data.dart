import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data with ChangeNotifier {
  DateTime? masa;
  TextEditingController waktu = TextEditingController();

  List<DateTime> _dumydata = [];
  List<DateTime> get dumydata {
    return [..._dumydata];
  }

  Future<void> pilihwaktu(BuildContext context) async {
    Navigator.of(context).push(
      showPicker(
        context: context,
        value: Time(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute),
        onChange: (Time? isi) {
          if (isi != null) {
            final inijam = DateTime.now();
            this.masa = DateTime(
              inijam.day,
              inijam.month,
              inijam.year,
              isi.hour,
              isi.minute,
            );
            // masa = inijam;
            waktu.text =
                "${isi.hour.toString().padLeft(2, '0')}: ${isi.minute.toString().padLeft(2, '0')}";
          }
        },
        is24HrFormat: true,
        iosStylePicker: true,
        accentColor: Colors.cyan,
      ),
    );
    notifyListeners();
  }

  Future<void> create() async {
    if (waktu.text.trim().isNotEmpty) {
      _dumydata.add(masa!);
      save();
      waktu.clear();
      masa = null;
    }
    notifyListeners();
  }

  Future<void> delete(int index) async {
    _dumydata.removeAt(index);
    save();
    notifyListeners();
  }

  Future<void> update(int index) async {
    final text = waktu.text.trim();
    if (text.isEmpty) return;

    // Bersihkan format dan split jam:menit
    final parts = text.replaceAll(": ", ":").split(":");

    // Validasi format jam:menit
    if (parts.length != 2) return;

    // Parse jam dan menit
    final inihour = int.tryParse(parts[0]);
    final iniminute = int.tryParse(parts[1]);

    // Pastikan jam dan menit valid
    if (inihour == null || iniminute == null) return;

    // Update dengan waktu baru, pertahankan tanggal asli
    final original = _dumydata[index];
    _dumydata[index] = DateTime(
      original.year,
      original.month,
      original.day,
      inihour,
      iniminute,
    );

    // Simpan dan bersihkan
    save();
    waktu.clear();
    masa = null;
    notifyListeners();
  }

  Future<void> save() async {
    SharedPreferences me = await SharedPreferences.getInstance();
    List<String>? ismukah = _dumydata.map((e) => e.toIso8601String()).toList();
    me.setStringList('ismukah', ismukah);
  }

  Future<void> load() async {
    SharedPreferences me = await SharedPreferences.getInstance();
    List<String>? isinya = me.getStringList('ismukah');
    if (isinya != null) {
      _dumydata = isinya.map((e) => DateTime.parse((e))).toList();
    }
    notifyListeners();
  }

  Data() {
    load();
  }
}
