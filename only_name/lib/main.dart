import 'package:flutter/material.dart';
import 'package:only_name/tugas.dart';
import 'package:provider/provider.dart';
import 'layers.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Tugas(), child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Layers(),
      routes: {Layers.nameroute: (ctx) => Layers()},
    );
  }
}
