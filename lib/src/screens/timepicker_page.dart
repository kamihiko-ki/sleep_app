import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleep_app/sign_out_page.dart';
import 'package:sleep_app/src/screens/bed_page.dart';
import 'package:sleep_app/src/screens/how_to.dart';
import 'package:sleep_app/src/screens/needtime_page.dart';

class TimePickerPage extends StatefulWidget {
  const TimePickerPage({Key? key}) : super(key: key);
  @override
  _TimePickerPageState createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  late TimeOfDay _timeOfDay;

  @override
  void initState() {
    _timeOfDay = TimeOfDay(hour: 0, minute: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //leading: Icon(Icons.menu),
        title: Text('最適タイミング',
            textAlign: TextAlign.center,
            style: GoogleFonts.passionsConflict(
              color: Color(0xFF000000),
              fontSize: 20,
            )), //ディレクトリの作成方法　libをダブルクリック→New→Directory

        backgroundColor: Colors.white60,
      ),
      body: Center(
        child: Container(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _timeOfDay.format(context),
                style: Theme.of(context).textTheme.headline2,
              ),
              TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.black54)),
                child: const Text(
                  '入眠時間or起床時間入力',
                  style: TextStyle(
                      decoration: TextDecoration
                          .underline), //constは黄色い波線のときに、もう変える気はないですよと鍵をかけたり、するイメージ。または、大丈夫？という波線に対して、断言して波線を消すイメージ。constとfinalは定数。
                ),
                onPressed: () async {
                  final TimeOfDay? timeOfDay = await showTimePicker(
                      context: context, initialTime: _timeOfDay);
                  if (timeOfDay != null)
                    setState(() => {_timeOfDay = timeOfDay});
                }, //asyncとawaitは非同期処理。
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NeedtimePage(
                          needTime: _timeOfDay,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    '最適な起床時刻',
                    style: TextStyle(fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black54, //数字は色の濃さ
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BedPage(
                          bedTime: _timeOfDay, //importは雷マークで更新してから出る。右がこのページの変数
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    '最適な入眠時刻',
                    style: TextStyle(fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black54, //数字は色の濃さ
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Container(
                  child: Text(
                    'カテゴリ一覧',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                ),
                decoration: BoxDecoration(color: Colors.grey[400]),
              ),
              ListTile(
                title: const Text("このアプリについて"),
                onTap: () {
                  // この中にメニューをタップした時の処理を記述する
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HowTo()));
                },
              ),
              ListTile(
                title: const Text("ログアウト"),
                onTap: () {
                  // この中にメニューをタップした時の処理を記述する
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInOutPage()));
                },
              ),
              ListTile(
                title: const Text("最適タイミングの使い方"),
                onTap: () {
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
                                "入眠時間を指定したら起床時刻を押そう\n起床予定時間を指定したら入眠時刻を押そう\n睡眠周期に合わせた目覚めが良いタイミングが分かるよ"),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: const Text("睡眠について"),
                onTap: () {
                  /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutPage()));*/
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
