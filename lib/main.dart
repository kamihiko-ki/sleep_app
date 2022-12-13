//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sleep_app/sign_in_page.dart';
import 'package:sleep_app/sign_out_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //koko
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
      ); //koko

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return const MaterialApp(
        home: SignInPage(),
      );
    }
    return const MaterialApp(
      home: SignInOutPage(),
    );
  }
}
