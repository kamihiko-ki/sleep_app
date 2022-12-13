import 'package:flutter/material.dart';
import 'package:sleep_app/future_page.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key});

  @override
  State<SleepPage> createState() => _SleepPageState();
}

int _currentSliderValue = 0;
int _wineSliderValue = 0;

class _SleepPageState extends State<SleepPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //scaffoldが親
      appBar: AppBar(
        centerTitle: true,
        title: Text('おやすみさん'),
        backgroundColor: Colors.white60,
      ),
      //Remove this widgetでwidgetが消せる
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, //start,center,end
        children: [
          Center(
            child: Text(
              '$_currentSliderValue',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          Slider(
            label: '$_currentSliderValue',
            activeColor: Colors.white60,
            inactiveColor: Colors.grey,
            min: 0,
            max: 10,
            value: _currentSliderValue.toDouble(),
            divisions: 10,
            onChanged: (value) {
              setState(
                () {
                  _currentSliderValue = value.toInt();
                },
              ); //setStateは更新ができるからstateFullで、更新しなくていいならstateLess
            },
          ),
          Center(
            child: Text(
              '$_wineSliderValue',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          Slider(
            label: '$_wineSliderValue',
            activeColor: Colors.white60,
            inactiveColor: Colors.grey,
            min: 0,
            max: 10,
            value: _wineSliderValue.toDouble(),
            divisions: 10,
            onChanged: (value) {
              setState(
                () {
                  _wineSliderValue = value.toInt();
                },
              ); //setStateは更新ができるからstateFullで、更新しなくていいならstateLess
            },
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FuturePage(
                      painPart:
                          _currentSliderValue, //今のページの変数：渡す変数のときは遷移先の変数,としなければならない。
                      wineTime: _wineSliderValue, //数分たたないと消えない変数のエラーが出る場合がある。
                    ),
                  ),
                );
              },
              child: const Text(
                '決定',
                style: TextStyle(fontSize: 15),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[400], //数字は色の濃さ
              ),
            ),
          ),
        ],
      ), //Columnのおかげで決定ボタンとスライダーが縦並び
    );
  }
}
