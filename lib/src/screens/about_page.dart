import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatefulWidget {
  //２.StatefulWidgetの赤くなっている部分を推して電球マークからmaterial.dartをインポート
  //3.～PageをRefactarでRenameする。（今回はSleepPage）
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  Widget build(BuildContext context) {
    //0.File→New→DartFileでNewDartFileを行って準備
    //１.importの下を別画面から全部コピー→Scaffoldの部分まで消す→もう一度Scaffoldの作成（これはあくまで覚えていない場合だから、appbar等を消さないのもOK）
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('睡眠について',
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
                Text('アルコールは入眠前の3時間以内に\n摂取すると中途覚醒を起こしてしまう\nこのため、睡眠効率が悪くなる',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.passionsConflict(
                      color: Colors.grey[200],
                      fontSize: 15,
                    )),
                Text('カフェインは入眠前の3時間以内に摂取するとを寝付けない時間が増えてしまうため、睡眠効率が悪くなる',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.passionsConflict(
                      color: Colors.grey[200],
                      fontSize: 15,
                    )),
                Text(
                    '現在、日本の4割が平均睡眠時間は6時間未満と、世界一眠らない国となっており、これを占めているのは成人済みの人達の傾向にある',
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
