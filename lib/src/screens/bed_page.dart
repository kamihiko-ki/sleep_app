import 'package:flutter/material.dart';

class BedPage extends StatefulWidget {
  //２.StatefulWidgetの赤くなっている部分を推して電球マークからmaterial.dartをインポート
  //3.～PageをRefactarでRenameする。（今回はSleepPage）
  const BedPage({Key? key, required this.bedTime}) : super(key: key);

  final TimeOfDay bedTime;

  @override
  State<BedPage> createState() => _BedPageState();
}

class _BedPageState extends State<BedPage> {
  @override
  Widget build(BuildContext context) {
    DateTime hoga = DateTime(
        2022, 11, 23, widget.bedTime.hour - 9, widget.bedTime.minute - 00);
    DateTime poga = DateTime(
        2022, 11, 23, widget.bedTime.hour - 7, widget.bedTime.minute - 30);

    return Scaffold(
      appBar: AppBar(
        title: Text('この時間に眠るべき'), //ディレクトリの作成方法　libをダブルクリック→New→Directory
        backgroundColor: Colors.yellow,
      ),
      body: Row(
        //Rowの左をAlt+Enterすると、今回はColumを増やした
        mainAxisAlignment: MainAxisAlignment.center,
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
                      hoga.hour.toString() + ':' + hoga.minute.toString(),
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
              SizedBox(
                width: 300,
                height: 200,
                child: Card(
                  child: Center(
                    child: Text(
                      poga.hour.toString() + ':' + poga.minute.toString(),
                      style: TextStyle(
                        fontSize: 65,
                        color: Colors.lightBlueAccent,
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

          //$は文字列のなかで変数を取り出すことができる。文字列なため、：は文字列のまま
          //変数は変数の前にwidget.をつけないといけない。また、変数が数字だった場合はtoString()をつけないといけない。Textで変数を表示させてる。
        ],
      ),
    );
  }
}
