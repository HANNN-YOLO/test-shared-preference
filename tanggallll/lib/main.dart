import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models.dart';
import 'layers.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Models(), child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Layers(),
      routes: {Layers.arah: (ctx) => Layers()},
    );
  }
}
