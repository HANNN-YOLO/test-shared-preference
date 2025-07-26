import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'awal.dart';
import 'nested.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Nested(), child: MainApp()),
  );
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => Awal()},
      initialRoute: '/',
    );
  }
}
