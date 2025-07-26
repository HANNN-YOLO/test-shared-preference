import 'package:flutter/material.dart';
import 'layar.dart';
import 'package:provider/provider.dart';
import 'models.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Models(), child: Main()));
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Layar(),
      routes: {Layar.route: (ctx) => Layar()},
    );
  }
}
