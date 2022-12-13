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
    //1
    DateTime hoga = DateTime(
        2022, 11, 23, widget.bedTime.hour - 9, widget.bedTime.minute - 00);
    DateTime poga = DateTime(
        2022, 11, 23, widget.bedTime.hour - 7, widget.bedTime.minute - 30);
    DateTime aoga = DateTime(
        2022, 11, 23, widget.bedTime.hour - 6, widget.bedTime.minute - 00);
    String minute =
        hoga.minute.toString() == '0' ? '00' : hoga.minute.toString();
    //minute変数で、０のとき００のときの場合分けを行ってる
    String minutea =
        poga.minute.toString() == '0' ? '00' : poga.minute.toString();
    //minute変数で、０のとき００のときの場合分けを行ってる
    String minuteb =
        aoga.minute.toString() == '0' ? '00' : aoga.minute.toString();
    //minute変数で、０のとき００のときの場合分けを行ってる

    //2
    DateTime boga = DateTime(
        2022, 11, 23, widget.bedTime.hour - 4, widget.bedTime.minute - 30);
    DateTime coga = DateTime(
        2022, 11, 23, widget.bedTime.hour - 3, widget.bedTime.minute - 00);
    DateTime doga = DateTime(
        2022, 11, 23, widget.bedTime.hour - 1, widget.bedTime.minute - 30);
    String minutec =
        hoga.minute.toString() == '0' ? '00' : hoga.minute.toString();
    //minute変数で、０のとき００のときの場合分けを行ってる
    String minuted =
        poga.minute.toString() == '0' ? '00' : poga.minute.toString();
    //minute変数で、０のとき００のときの場合分けを行ってる
    String minutee =
        aoga.minute.toString() == '0' ? '00' : aoga.minute.toString();
    //minute変数で、０のとき００のときの場合分けを行ってる

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('この時間に眠るべき'), //ディレクトリの作成方法　libをダブルクリック→New→Directory
        backgroundColor: Colors.white60,
      ),
      body: Row(
        //Rowの左をAlt+Enterすると、今回はColumを増やした
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    //1
                    width: 300,
                    height: 200,
                    child: Card(
                      child: Center(
                        child: Text(
                          hoga.hour.toString() + ':' + minute,
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
                    //2
                    width: 300,
                    height: 200,
                    child: Card(
                      child: Center(
                        child: Text(
                          poga.hour.toString() + ':' + minutea,
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
                  SizedBox(
                    //3
                    width: 300,
                    height: 200,
                    child: Card(
                      child: Center(
                        child: Text(
                          aoga.hour.toString() + ':' + minuteb,
                          style: TextStyle(
                            fontSize: 65,
                            color: Colors.black26,
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
                    //4
                    width: 300,
                    height: 200,
                    child: Card(
                      child: Center(
                        child: Text(
                          boga.hour.toString() + ':' + minutec,
                          style: TextStyle(
                            fontSize: 65,
                            color: Colors.black38,
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
                    //2
                    width: 300,
                    height: 200,
                    child: Card(
                      child: Center(
                        child: Text(
                          coga.hour.toString() + ':' + minuted,
                          style: TextStyle(
                            fontSize: 65,
                            color: Colors.black45,
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
                    //3
                    width: 300,
                    height: 200,
                    child: Card(
                      child: Center(
                        child: Text(
                          doga.hour.toString() + ':' + minutee,
                          style: TextStyle(
                            fontSize: 65,
                            color: Colors.black54,
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
            ),
          ),

          //$は文字列のなかで変数を取り出すことができる。文字列なため、：は文字列のまま
          //変数は変数の前にwidget.をつけないといけない。また、変数が数字だった場合はtoString()をつけないといけない。Textで変数を表示させてる。
        ],
      ),
    );
  }
}
