import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'awal.dart';
import 'providers.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Providers(), child: Main()),
  );
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Awal(),
      routes: {Awal.harus: (ctx) => Awal()},
    );
  }
}
