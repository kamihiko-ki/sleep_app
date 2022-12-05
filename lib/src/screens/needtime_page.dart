import 'package:flutter/material.dart';

class NeedtimePage extends StatefulWidget {
  const NeedtimePage({Key? key, required this.needTime}) : super(key: key);

  final TimeOfDay needTime;

  @override
  State<NeedtimePage> createState() => _NeedtimePageState();
}

class _NeedtimePageState extends State<NeedtimePage> {
  int num = 90; //intは型　intは整数　numは適当な変数名

  @override
  Widget build(BuildContext context) {
    //TimeOfDay hoge = widget.needTime.;
    DateTime hoga = DateTime(
        2022, 11, 23, widget.needTime.hour + 9, widget.needTime.minute + 0);
    //needTimeをDateTime型に変更
    DateTime poga = DateTime(
        2022, 11, 23, widget.needTime.hour + 7, widget.needTime.minute + 30);
    //TimeOfDay hoge = TimeOfDay(hour: hoga.hour, minute: hoga.minute);
    return Scaffold(
      appBar: AppBar(
        title: Text('この時間に起きるべき'), //ディレクトリの作成方法　libをダブルクリック→New→Directory
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        child: Row(
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
          ],
        ),
      ),
    );
  }
}
//widget.needTime.hour.toString()
//'${widget.needTime.hour.toString()}:${widget.needTime.minute.toString()}'),
//widget.needTime.hour.toString() + ':' + widget.needTime.minute.toString(),
//*'${widget.needTime.hour.toString()}  ${+} ${num.toString()}:${widget.needTime.minute.toString()}'),
//*widget.needTime.hour.toString() + num.toString() +':' + widget.needTime.minute.toString(),
