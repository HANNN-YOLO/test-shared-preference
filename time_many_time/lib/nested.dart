import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:intl/intl.dart';

class Nested with ChangeNotifier {
  DateTime? waktu;
  TextEditingController penulisan = TextEditingController();

  List<DateTime> _masa = [];
  List<DateTime> get masa {
    return [..._masa];
  }

  Future<void> isi(BuildContext context) async {
    Navigator.of(context).push(
      showPicker(
        context: context,
        value: Time(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute),
        // value: DateFormat('HH:mm').format(waktu),
        onChange: (Time? pengisian) {
          if (pengisian != null) {
            final isi = DateTime.now();
            this.waktu = DateTime(
              isi.day,
              isi.month,
              isi.year,
              pengisian.hour,
              pengisian.minute,
            );
            penulisan.text =
                "${pengisian.hour.toString().padLeft(2, '0')}: ${pengisian.minute.toString().padLeft(2, '0')}";
            notifyListeners();
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
    if (penulisan.text.trim().isNotEmpty) {
      _masa.add(waktu!);
      simpan();
      penulisan.clear();
      waktu = null;
    }
    notifyListeners();
  }

  Future<void> simpan() async {
    SharedPreferences me = await SharedPreferences.getInstance();
    List<String>? aku = _masa.map((e) => e.toIso8601String()).toList();
    await me.setStringList('aku', aku);
  }

  Future<void> load() async {
    SharedPreferences me = await SharedPreferences.getInstance();
    List<String>? ismukah = me.getStringList('aku');
    if (ismukah != null) {
      _masa = ismukah.map((e) => DateTime.parse(e)).toList();
    }
    notifyListeners();
  }

  Nested() {
    load();
  }
}
