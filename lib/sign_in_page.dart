//以下がメールアドレスログイン

//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:sleep_app/src/app.dart';

/*
class MyAuthPage extends StatefulWidget {
  @override
  _MyAuthPageState createState() => _MyAuthPageState();
}

class _MyAuthPageState extends State<MyAuthPage> {
  // 入力されたユーザーの名前
  String newUser = "";

  // 入力されたメールアドレス
  String newUserEmail = "";

  // 入力されたパスワード
  String newUserPassword = "";

  // 登録・ログインに関する情報を表示
  String infoText = "";

  // FireStoreにユーザー情報を登録する関数を定義
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> register() async {
    // 上で定義したメンバ変数を格納すると、usersコレクションに、
    // メールアドレスとパスワードも保存できる。

    await users
        .doc()
        .set({
          'name': newUser,
          'email': newUserEmail,
          'password': newUserPassword
        })
        .then((value) => print("新規登録に成功"))
        .catchError((error) => print("新規登録に失敗しました!: $error"));
    print('登録');
  }

// メールアドレスとパスワードを登録する関数を定義
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> createAuth() async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
      email: newUserEmail,
      password: newUserPassword,
    );
    final User user = result.user!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザー登録'),
      ),
      // キーボードで隠れて、黄色エラーが出るので
      // SingleChildScrollViewで、Centerウイジットをラップする
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // かっこよくしたいので、画像を配置した!
                const CircleAvatar(
                  radius: 75,
                  // images.unsplash.comの画像のパスを貼り付ける
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1658033014478-cc3b36e31a5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  // テキスト入力のラベルを設定
                  decoration: InputDecoration(labelText: "ユーザー名"),
                  onChanged: (String value) {
                    setState(() {
                      newUser = value;
                    });
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  // テキスト入力のラベルを設定
                  decoration: InputDecoration(labelText: "メールアドレス"),
                  onChanged: (String value) {
                    setState(() {
                      newUserEmail = value;
                    });
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(labelText: "パスワード（６文字以上）"),
                  // パスワードが見えないようにする
                  obscureText: true,
                  onChanged: (String value) {
                    setState(() {
                      newUserPassword = value;
                    });
                  },
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      // FireStoreにユーザー情報を登録する関数
                      await register();
                      // メール/パスワードでユーザー登録
                      await createAuth();
                      // 登録したユーザー情報
                    } catch (e) {
                      // 登録に失敗した場合
                      setState(() {
                        infoText = "登録NG:${e.toString()}";
                      });
                    }
                  },
                  child: Text("ユーザー登録"),
                ),
                const SizedBox(height: 8),
                Text(infoText)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

//以下がGoogleサインイン

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sleep_app/src/app.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Future<UserCredential> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential result =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = result.user;
    final users = user?.uid;
//?はuserがnullだから
    await FirebaseFirestore.instance.collection('user').doc(users).set({
      'uid': users,
    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Oyasumisan',
            textAlign: TextAlign.center,
            style: GoogleFonts.passionsConflict(
              color: Color(0xFF000000),
              fontSize: 50,
            )),
        backgroundColor: Colors.white60,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('aaa'),
                Gap(64),
                ElevatedButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    await signInWithGoogle();
                    if (!mounted) {
                      return;
                    }
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                        return const MyHomePage();
                      }),
                      (route) => false,
                    );
                  },
                  child: const Text('Googleサインイン'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black54, //数字は色の濃さ
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
