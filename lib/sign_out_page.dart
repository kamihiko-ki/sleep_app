import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sleep_app/sign_in_page.dart';

class SignInOutPage extends StatefulWidget {
  const SignInOutPage({super.key});

  @override
  State<SignInOutPage> createState() => _SignInOutPageState();
}

class _SignInOutPageState extends State<SignInOutPage> {
  Future<void> singOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('sign-out',
            textAlign: TextAlign.center,
            style: GoogleFonts.passionsConflict(
              color: Color(0xFF000000),
              fontSize: 50,
            )),
        backgroundColor: Colors.white60,
      ),
      body: Container(
        height: 693,
        width: 392,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            colors: [
              const Color(0xff181c80).withOpacity(
                  0.6), //https://higashi-dance-network.appspot.com/iromiru/にｆ画像を貼り付けで、fから先にコードを入れ替える
              const Color(0xff9941d8).withOpacity(0.6),
            ],
            stops: const [
              0.0,
              1.0,
            ],
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
              await singOut();
              if (!mounted) {
                return;
              }
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
                  return SignInPage();
                }),
                (route) => false,
              );
            },
            child: const Text('Googleサインアウト'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black54, //数字は色の濃さ
            ),
          ),
        ),
      ),
    );
  }
}
