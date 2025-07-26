import 'package:flutter/material.dart';
import 'package:last_provider/data.dart';
import 'package:provider/provider.dart';
import './tampilan.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Data(), child: MeApp()));
}

class MeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Tampilan());
  }
}
