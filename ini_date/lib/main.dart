import 'package:flutter/material.dart';
import 'tampilan.dart';
import 'package:provider/provider.dart';
import 'menghilang.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Menghilang(), child: App()),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tampilan(),
      routes: {Tampilan.isi: (context) => Tampilan()},
    );
  }
}
