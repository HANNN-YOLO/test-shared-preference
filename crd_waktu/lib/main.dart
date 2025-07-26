import 'package:flutter/material.dart';
import 'screen.dart';
import 'package:provider/provider.dart';
import 'nested.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Nested(), child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'Screens': (context) => Screen()},
      initialRoute: 'Screens',
    );
  }
}
