import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  //２.StatefulWidgetの赤くなっている部分を推して電球マークからmaterial.dartをインポート
  //3.～PageをRefactarでRenameする。（今回はSleepPage）
  const HomePage({Key? key, required this.sleep, required this.wakeup})
      : super(key: key);

  final DateTime? sleep;
  final DateTime wakeup; //dayだけ取る　　名前付き引数は、別のページからとってくるといったもとからある変数

  @override
  State<HomePage> createState() => _HomePageState();
}

///日付と体重を持つクラスを作成
class WeightData {
  final DateTime date;
  final double weight;

  //final DateTime LineTime　;

  WeightData(this.date, this.weight);
}

class _HomePageState extends State<HomePage> {
  final prefs = SharedPreferences.getInstance();

  DateTime? date;
  //int _counter = 0;

  void _incrementCounter() async {
    setState(
      () {
        //setStateはbuildメソッドが起動したときにまわる
        //++;

        // Shared Preferenceに値を保存する。
        //
      },
    );
  }

  // var dif =
  //  widget.sleep.difference(widget.wakeup).inHours; //widget.をつけるときは名前付き引数

  // DateTime best = DateTime(2022, 11, 23, dif.hour - 9, dif.minute - 00);

  double need() {
    var dif = widget.wakeup
        .difference(widget.sleep!)
        .inMinutes; //widget.をつけるときは名前付き引数
    return dif!.toDouble() - 420 ?? 0; //returnの後にdifを返すけど、nullだった場合に??の後ろの値になる

    //voidがreturnが書かれていないときで、return（返り値）を付けるなら変数の型を先にして関数名
  }

  double get answer => need(); //needのreturn値が入っている

  @override
  void initState() {
    super.initState();
    // 初期化時にShared Preferencesに保存している値を読み込む
    // _getPrefItems();
  }

  /*_getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 以下の「counter」がキー名。見つからなければ０を返す
    setState(() {
      answer = prefs.getDouble('answer') ?? 0;
    });
  }*/

  Widget build(BuildContext context) {
    //入眠時刻と起床時刻の差分と、そこから7時間引いている

    void _incrementCounter() async {
      setState(
        () {
          //setStateはbuildメソッドが起動したときにまわる
          //++;

          // Shared Preferenceに値を保存する。
          //
        },
      );
    }

    /*// Shared Preferenceに値を保存されているデータを読み込んで_counterにセットする。
    _getPrefItems() async {
      //_getPrefItemsが_setPrefItemsで保存した値を取り出してくる。
      //setが値を保存する　getが取り出してくる
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // 以下の「counter」がキー名。見つからなければ０を返す
      setState(() {
        answer = prefs.getDouble('answer') ?? 0;
      });
    }*/

    // Shared Preferenceにデータを書き込む
    _setPrefItems() async {
      //  SharedPreferences prefs = await SharedPreferences.getInstance();
      // 以下の「counter」がキー名。
      // prefs.setDouble('answer', answer);

      // double need() {
      //  var dif = widget.wakeup
      //     .difference(widget.sleep!)
      //     .inMinutes; //widget.をつけるときは名前付き引数
      //  return dif!.toDouble() - 420 ??
      //      0; //returnの後にdifを返すけど、nullだった場合に??の後ろの値になる

      //voidがreturnが書かれていないときで、return（返り値）を付けるなら変数の型を先にして関数名
      // }
    }

    //WeightDataのリストを作成。日付と分単位時間を入れる
    final weightList = <WeightData>[
      WeightData(DateTime(2022, 12, 6), 56),
      WeightData(DateTime(2022, 12, 7), 23),
      WeightData(DateTime(2022, 12, 8), 40),
      WeightData(DateTime(2022, 12, 9), 45),
      WeightData(DateTime(2022, 12, 10), 79),
      WeightData(DateTime(2022, 12, 11), 40),
      WeightData(
          DateTime(widget.wakeup.year, widget.wakeup.month, widget.wakeup.day),
          answer
          //need()
          ),
      //全選択したうえで、ctrl+shift+/をすれば一気にコメントアウトできる
    ];

    /*void initState() {
      getDataFromFireStore().then((results) {
        SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
          setState(() {});
        });
      });
      super.initState();
    }

    Future<void> getDataFromFireStore() async {
      var snapShotsValue =
          await FirebaseFirestore.instance.collection("chartData").get();
      List<WeightData> list = snapShotsValue.docs
          .map((e) => WeightData(
              x: DateTime.fromMillisecondsSinceEpoch(
                  e.data()['x'].millisecondsSinceEpoch),
              y: e.data()['y']))
          .toList();
      setState(() {
        weightData = list;
      });
    }

    // Class for chart data source, this can be modified based on the data in Firestore
    class WeightData {
    WeightData({this.x, this.y});
    final DateTime? x;
    final int? y;
    }*/

    //上のリストからグラフに表示させるデータを生成
    List<charts.Series<WeightData, DateTime>> _createWeightData(
        List<WeightData> weightList) {
      return [
        charts.Series<WeightData, DateTime>(
          id: 'Muscles',
          data: weightList,
          colorFn: (_, __) =>
              charts.MaterialPalette.white, //blue.shadeDefault, //グラフのライン色変更
          domainFn: (WeightData weightData, _) =>
              weightData.date, //おそらく、WeightDataからdateを出している
          measureFn: (WeightData weightData, _) => weightData.weight,
        )
      ];
    }

    //0.File→New→DartFileでNewDartFileを行って準備
    //１.importの下を別画面から全部コピー→Scaffoldの部分まで消す→もう一度Scaffoldの作成（これはあくまで覚えていない場合だから、appbar等を消さないのもOK）
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: Padding(
              padding: EdgeInsets.all(10.0),
              child: FaIcon(FontAwesomeIcons.circleQuestion),
            ),
            onPressed: () {
              //下が処理
              //Navigator.push(
              //context, MaterialPageRoute(builder: (context) => HowTo()));
              showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: Text("グラフの見方"),
                    children: <Widget>[
                      // コンテンツ領域
                      SimpleDialogOption(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                            "グラフは平均睡眠時間の7時間差し引かれています\n自分の睡眠時間の管理に役立てて下さい\nマイナスになれば平均睡眠時間より少ないです"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ], //action[]が右
        title: Text('睡眠グラフ'), //ディレクトリの作成方法　libをダブルクリック→New→Directory
        backgroundColor: Color(0xff527aaf), //white60,
        //backgroundColorStart: const Color(0xffe4a972),
        //backgroundColorEnd: const Color(0xff9941d8),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text(
            //'睡眠グラフ',
            //style: TextStyle(
            // fontSize: 20,
            // color: Colors.lightBlueAccent,
            //),
            // ),
            Container(
              height: 693,
              //  decoration: BoxDecoration(
              //decorationはContainerのなかのみ
              //   gradient: new LinearGradient(
              //  colors: [
              //    Color(0xffe4a972).withOpacity(0.6),
              //   Color(0xff9941d8).withOpacity(0.6),
              //  ],
              //  begin: Alignment.topRight,
              //  end: Alignment.bottomLeft,
              //   ),
              //   ),
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
              child: charts.TimeSeriesChart(
                _createWeightData(weightList),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //WeightDataのリストを作成。日付と分単位時間を入れる

//上のリストからグラフに表示させるデータを生成
  /*List<charts.Series<WeightData, DateTime>> _createWeightData(
      List<WeightData> weightList) {
    return [
      charts.Series<WeightData, DateTime>(
        id: 'Muscles',
        data: weightList,
        colorFn: (_, __) =>
            charts.MaterialPalette.blue.shadeDefault, //グラフのライン色変更
        domainFn: (WeightData weightData, _) =>
            weightData.date, //おそらく、WeightDataからdateを出している
        measureFn: (WeightData weightData, _) => weightData.weight,
      )
    ];
  }*/
}

//公式ディファレンス　Usage以下で書き込み方（intagerならintとか）、
//公式ディファレンス exampleでカウンターアプリで例が出されている
//左上のFileの段にあるCodeのReformatCodeで、コードが綺麗になる。Ctrl+Sは稲妻マークを押さないでもホットリロードがかかる。
//単語とかを全選択して、Ctrl+クリックしたらリンクみたいに同じ単語にいく。また、Widgetを押すとWidgetとはなにかというところにいく。
