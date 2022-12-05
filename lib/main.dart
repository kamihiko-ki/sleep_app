import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //koko
  await Firebase.initializeApp(); //koko

  runApp(const MyApp());
}
