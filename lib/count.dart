import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sleep_app/src/screens/home_page.dart';

class CountApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Datepicker Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountPage(title: 'Flutter Datepicker Sample'),
    );
  }
}

class CountPage extends StatefulWidget {
  //２.StatefulWidgetの赤くなっている部分を推して電球マークからmaterial.dartをインポート
  //3.～PageをRefactarでRenameする。（今回はSleepPage）
  const CountPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CountPage> createState() => _CountPageState();
}

DateTime _inputDate = DateTime.now();

class _CountPageState extends State<CountPage> {
  // 選択した日時を格納する変数
  var _mydatetime = DateTime.now();

  DateTime _mywakeuptime = DateTime.now();
  // 日時を指定したフォーマットで指定するためのフォーマッター
  //var datetime = _mywakeuptime.hour;
  var formatter = DateFormat('yyyy/MM/dd(E) HH:mm');

  @override
  Widget build(BuildContext context) {
    //0.File→New→DartFileでNewDartFileを行って準備
    //１.importの下を別画面から全部コピー→Scaffoldの部分まで消す→もう一度Scaffoldの作成（これはあくまで覚えていない場合だから、appbar等を消さないのもOK）

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        /*actions: [
          IconButton(
            icon: Padding(
              padding: EdgeInsets.all(10.0),
              child: FaIcon(FontAwesomeIcons.clipboardQuestion),
            ),
            onPressed: () {
              //下が処理
              //Navigator.push(
              //context, MaterialPageRoute(builder: (context) => HowTo()));
              showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: Text("タイトル"),
                    children: <Widget>[
                      // コンテンツ領域
                      SimpleDialogOption(
                        onPressed: () => Navigator.pop(context),
                        child: Text("１項目目"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ], //action[]が右*/

        leading: IconButton(
          icon: Padding(
            padding: EdgeInsets.all(10.0),
            child: FaIcon(FontAwesomeIcons.clipboardQuestion),
          ),
          onPressed: () {
            //下が処理
            //Navigator.push(
            //context, MaterialPageRoute(builder: (context) => HowTo()));
            showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  title: Text("使い方"),
                  children: <Widget>[
                    // コンテンツ領域
                    SimpleDialogOption(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                          "月マークのボタンが前日の入眠日時\n太陽マークのボタンが起床時刻\n入眠日時と起床時刻を入れて決定ボタンを押してください"),
                    ),
                  ],
                );
              },
            );
          },
        ),
        title: Text('カウント',
            textAlign: TextAlign.center,
            style: GoogleFonts.passionsConflict(
              color: Color(0xFF000000),
              fontSize: 20,
            )), //ディレクトリの作成方法　libをダブルクリック→New→Directory

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
              children: <Widget>[
                Text(
                  'あなたが選択した入眠日時は以下です ',
                ),
                Text(
                  // フォーマッターを使用して指定したフォーマットで日時を表示
                  // format()に渡すのはDate型の値で、String型で返される
                  formatter.format(_mydatetime),
                  style: Theme.of(context).textTheme.headline4,
                ),
                Gap(16),
                FloatingActionButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        // onChanged内の処理はDatepickerの選択に応じて毎回呼び出される
                        onChanged: (date) {
                      // print('change $date');
                    },
                        // onConfirm内の処理はDatepickerで選択完了後に呼び出される
                        onConfirm: (date) {
                      setState(() {
                        _mydatetime = date;
                      });
                    },
                        // Datepickerのデフォルトで表示する日時
                        currentTime: DateTime.now(),
                        // localによって色々な言語に対応
                        locale: LocaleType.jp);
                  },
                  tooltip: 'Datetime',
                  child: Icon(Icons.nights_stay),
                  //もともとは（Icons.access_time）
                  backgroundColor: Colors.black,
                ),
                Gap(16),
                Text(
                  'あなたが選択した起床日時は以下です ',
                ),
                Text(
                  // フォーマッターを使用して指定したフォーマットで日時を表示
                  // format()に渡すのはDate型の値で、String型で返される
                  formatter.format(_mywakeuptime),
                  style: Theme.of(context).textTheme.headline4,
                ),
                Gap(16),
                FloatingActionButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        // onChanged内の処理はDatepickerの選択に応じて毎回呼び出される
                        onChanged: (date) {
                      // print('change $date');
                    },
                        // onConfirm内の処理はDatepickerで選択完了後に呼び出される
                        onConfirm: (date) {
                      setState(() {
                        _mywakeuptime = date;
                      });
                    },
                        // Datepickerのデフォルトで表示する日時
                        currentTime: DateTime.now(),
                        // localによって色々な言語に対応
                        locale: LocaleType.jp);
                  },
                  tooltip: 'Datetime',
                  child: Icon(Icons.sunny),
                  backgroundColor: Colors.black,
                ),
                Gap(16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            sleep:
                                _mydatetime, //今のページの変数：渡す変数のときは遷移先の変数,としなければならない。
                            wakeup: _mywakeuptime, //数分たたないと消えない変数のエラーが出る場合がある。
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      '決定',
                      style: TextStyle(fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.grey[400], //数字は色の濃さ
                      backgroundColor: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //Future _openSample1(BuildContext context) async {
  // （3） ダイアログを表示する
  //final DateTime? _date = await showDatePicker(
  //context: context,
  // （4） 処理指定日付
  //initialDate: DateTime.now(),
  // （5） 指定できる日付範囲
  //firstDate: DateTime(2022, 1, 1),
  //lastDate: DateTime(2022, 12, 31),
  //);
  // （6） 選択された場合に、値を設定する
  //if (_date != null) {
  //setState(() {
  //_inputDate = _date;
  //});
  //}
  //}
}
//最初にBuild gradleとapp/Build gradleのコメントアウトを先に外してから、pubspecyamlのfirebasecoreのコメントアウトを外す。次に、main.dartのコメントアウトを外してimportできるか試す。
