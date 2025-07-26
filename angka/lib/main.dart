import 'package:flutter/material.dart';
import 'awal.dart';
import 'package:provider/provider.dart';
import 'data.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Data(), child: Main()));
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {Awal.route: (ctx) => Awal()},
      home: Awal(),
    );
  }
}
