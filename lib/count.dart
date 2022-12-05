import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

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
  var _mydatetime = new DateTime.now();
  // 日時を指定したフォーマットで指定するためのフォーマッター
  var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm');

  @override
  Widget build(BuildContext context) {
    //0.File→New→DartFileでNewDartFileを行って準備
    //１.importの下を別画面から全部コピー→Scaffoldの部分まで消す→もう一度Scaffoldの作成（これはあくまで覚えていない場合だから、appbar等を消さないのもOK）

    return Scaffold(
      appBar: AppBar(
        title: Text('カウント'), //ディレクトリの作成方法　libをダブルクリック→New→Directory
        backgroundColor: Colors.blue,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'あなたが選択した日時は以下です: ',
              ),
              Text(
                // フォーマッターを使用して指定したフォーマットで日時を表示
                // format()に渡すのはDate型の値で、String型で返される
                formatter.format(_mydatetime),
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DatePicker.showDateTimePicker(context, showTitleActions: true,
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
        child: Icon(Icons.access_time),
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
