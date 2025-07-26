import 'package:flutter/material.dart';
import '/models.dart';
import 'layar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Models(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Layar(),
      routes: {Layar.nameroute: (ctx) => Layar()},
    );
  }
}
