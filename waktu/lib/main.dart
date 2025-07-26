import 'package:flutter/material.dart';
import '/awal.dart';
import '/data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Data(), child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {"Awal": (context) => Awal()},
      initialRoute: "Awal",

      // theme: ThemeData(
      //   buttonTheme: ButtonThemeData(
      //     shape:
      //   )
      // ),
    );
  }
}
