import 'package:flutter/material.dart';
import 'package:sleep_app/count.dart';
import 'package:sleep_app/sign_in_page.dart';
//import 'package:sleep_app/sign_in_page.dart';
import 'package:sleep_app/src/screens/timepicker_page.dart';

//import '../sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
       SignInPage(), //MyHomePage(), //ここでホームの設定していて、別画面の作成にはクラスなどを作成しておかなければならない。
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final _screens = <dynamic>[
    //[]がファイル
    //constが再代入不可能だから、色みたいな決まってるもの　finalはdatatime型みたいな変わるもの
    // HomePage(
    //   sleep: null,
    //   wakeup: null,
    // ), //名前付き引数でaddのエラーが出ていたら、値はstring型が(sleep:'', wakeup:''),int型は(sleep:0, wakeup:0)といったようにシングルクォーテーションか0を入れておく
    TimePickerPage(),
    // SleepPage(),
    CountPage(
      title: 'Flutter Datepicker Sample',
    ) //ページを記述して作成してからココに増やす
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            //  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time), label: 'お気に入り'),
            //   BottomNavigationBarItem(
            //       icon: FaIcon(FontAwesomeIcons.moon), label: '計算'),
            BottomNavigationBarItem(
                icon: Icon(Icons.airline_seat_individual_suite_rounded),
                label: '睡眠'),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          //backgroundColor: Color(0xff9941d8),
        ));
  }
}
