import 'package:firebase_database/firebase_database.dart';
import 'models.dart';

class Services {
  final DatabaseReference _boku = FirebaseDatabase.instance.ref('Isi');

  Future<void> create(Models models) async {
    final isi = _boku.push().key;

    final kebaruan = Models(
      kunci: isi,
      nama: models.nama,
      nim: models.nim,
      ttl: models.ttl,
      createdAt: models.createdAt,
    );

    await _boku.child(isi!).set(kebaruan.create());
  }

  Future<List<Models>> readonly() async {
    final peluru = await _boku.get();
    List<Models> models = [];

    if (peluru.exists) {
      final tembakan = peluru.value as Map;
      tembakan.forEach((key, value) {
        if (value is Map) {
          final item = Map<String, dynamic>.from(value as Map);
          models.add(Models.read(key, item));
        }
      });
    }
    return models;
  }
}
