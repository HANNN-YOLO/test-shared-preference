import 'layae.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'fungsi.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Fungsi(), child: app()));
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'Layar': (context) => Layar()},
      initialRoute: 'Layar',
    );
  }
}
