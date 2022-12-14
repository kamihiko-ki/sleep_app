import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowTo extends StatefulWidget {
  //２.StatefulWidgetの赤くなっている部分を推して電球マークからmaterial.dartをインポート
  //3.～PageをRefactarでRenameする。（今回はSleepPage）
  const HowTo({Key? key}) : super(key: key);

  @override
  State<HowTo> createState() => _HowToState();
}

class _HowToState extends State<HowTo> {
  Widget build(BuildContext context) {
    //0.File→New→DartFileでNewDartFileを行って準備
    //１.importの下を別画面から全部コピー→Scaffoldの部分まで消す→もう一度Scaffoldの作成（これはあくまで覚えていない場合だから、appbar等を消さないのもOK）
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('アプリについて',
            textAlign: TextAlign.center,
            style: GoogleFonts.passionsConflict(
              color: Colors.grey[600],
              fontSize: 30,
            )),
        backgroundColor: Colors.white60,
      ),
      body: Container(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('寝る前に少しの操作だけ！',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.passionsConflict(
                      color: Colors.grey[200],
                      fontSize: 15,
                    )),
                Text('それだけで自分にとってより良い睡眠方法が分かる！',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.passionsConflict(
                      color: Colors.grey[200],
                      fontSize: 15,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
