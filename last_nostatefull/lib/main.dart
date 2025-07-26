import 'package:flutter/material.dart';
import 'screens.dart';
import 'providers.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'penghubung.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(create: (context) => Penghubung(), child: app()),
  );
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.microtask(
      () => {Provider.of<Penghubung>(context, listen: false).read()},
    );
    return MaterialApp(debugShowCheckedModeBanner: false, home: Screens());
  }
}
