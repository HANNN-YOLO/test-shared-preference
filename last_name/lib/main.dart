import 'package:flutter/material.dart';
import 'awal.dart';
import 'package:provider/provider.dart';
import 'fungsi.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (ctx) => Fungsi(), child: App()),
    // ChangeNotifierProvider(builder: (context, child) => Fungsi(), child: App()),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Awal(),
      routes: {Awal.nameroute: (ctx) => Awal()},
    );
  }
}
