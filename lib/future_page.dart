import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({Key? key, required this.painPart}) : super(key: key);
  final int painPart; //finalはもう変える気はないですよと鍵をかけるイメージ。constとfinalは定数。

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('すいみんよほう'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center, //Rowが横
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 200,
                child: Card(
                  child: Center(
                    child: Text(
                      widget.painPart.toString(),
                      style: TextStyle(
                        fontSize: 65,
                        color: Colors.blue,
                      ),

                      //$は文字列のなかで変数を取り出すことができる。文字列なため、：は文字列のまま
                      //変数は変数の前にwidget.をつけないといけない。また、変数が数字だった場合はtoString()をつけないといけない。Textで変数を表示させてる。
                    ),
                  ),
                  color: Colors.white,
                  margin: const EdgeInsets.all(30), //Cardの外側の余白を設定するオプション
                  elevation: 8, // 影の離れ具合を調整するオプション
                  shadowColor: Colors.black, // 影の色を設定するオプション
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
