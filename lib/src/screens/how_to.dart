import 'package:flutter/material.dart';

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
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('aaaa')],
          ),
        ],
      ),
    );
  }
}
