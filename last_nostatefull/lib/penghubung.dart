import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'models.dart';
import 'services.dart';

class Penghubung with ChangeNotifier {
  late List<Models> _dumydata = [];
  List<Models> get dumydata {
    return [..._dumydata];
  }

  final Services _harapan = Services();

  Future<void> create(String nama, int umur, BuildContext context) async {
    if (nama.isEmpty || umur == null) {
      pemberitahuan("Lengkapi datanya dulu", context);
    }

    final bokuwo = Models(nama: nama, nim: umur);

    await _harapan.create(bokuwo);
    pemberitahuan("Yattane", context);
    notifyListeners();
  }

  Future<void> read() async {
    final hasil = await _harapan.readonly();
    _dumydata = hasil;
    print("[DEBUG] Jumlah data dari Firebase: " + _dumydata.length.toString());
    for (var item in _dumydata) {
      print(
        "[DEBUG] Data: nama=${item.nama}, nim=${item.nim}, kunci=${item.kunci}",
      );
    }
    notifyListeners();
  }

  void pemberitahuan(String keluhkesah, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(keluhkesah), duration: Duration(seconds: 2)),
    );
  }

  Penghubung() {
    read();
  }
}
