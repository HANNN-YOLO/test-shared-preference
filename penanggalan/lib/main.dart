import 'package:flutter/material.dart';
import 'layar.dart';
import 'fungsi.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Fungsi(), child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Layar(),
      routes: {Layar.penamaan: (ctyx) => Layar()},
    );
  }
}
