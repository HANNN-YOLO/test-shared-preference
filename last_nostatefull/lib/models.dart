import 'package:flutter/foundation.dart';

class Models {
  String? kunci;
  String? nama;
  int? nim;
  String? savename;
  int? savenim;
  String? ttl;
  String? savettl;
  DateTime? createdAt;

  Models({
    this.kunci,
    this.nama,
    this.nim,
    this.savename,
    this.savenim,
    this.ttl,
    this.savettl,
    this.createdAt,
  });

  Map<String, dynamic> create() {
    return {
      'kunci': kunci,
      'nama': nama,
      'nim': nim,
      'ttl': ttl,
      'createdAt': createdAt,
    };
  }

  factory Models.read(String kunci, Map<String, dynamic> json) {
    return Models(
      kunci: kunci,
      nama: json['nama'],
      nim: json['nim'],
      ttl: json['ttl'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }
}
