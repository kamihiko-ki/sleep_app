import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  //２.StatefulWidgetの赤くなっている部分を推して電球マークからmaterial.dartをインポート
  //3.～PageをRefactarでRenameする。（今回はSleepPage）
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

///日付と体重を持つクラスを作成
class WeightData {
  final DateTime date;
  final double weight;

  WeightData(this.date, this.weight);
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //0.File→New→DartFileでNewDartFileを行って準備
    //１.importの下を別画面から全部コピー→Scaffoldの部分まで消す→もう一度Scaffoldの作成（これはあくまで覚えていない場合だから、appbar等を消さないのもOK）
    return Scaffold(
      appBar: AppBar(
        title: Text('ほーむ'), //ディレクトリの作成方法　libをダブルクリック→New→Directory
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '睡眠グラフ',
              style: TextStyle(
                fontSize: 20,
                color: Colors.lightBlueAccent,
              ),
            ),
            Container(
              height: 500,
              child: charts.TimeSeriesChart(
                _createWeightData(weightList),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //WeightDataのリストを作成。好きな日付と体重入れよう
  final weightList = <WeightData>[
    WeightData(DateTime(2020, 10, 1), 50),
    WeightData(DateTime(2020, 10, 2), 56),
    WeightData(DateTime(2020, 10, 3), 23),
    WeightData(DateTime(2020, 10, 4), 40),
    WeightData(DateTime(2020, 10, 5), 45),
    WeightData(DateTime(2020, 10, 6), 79),
    WeightData(DateTime(2020, 10, 7), 40)
  ];

//上のリストからグラフに表示させるデータを生成
  List<charts.Series<WeightData, DateTime>> _createWeightData(
      List<WeightData> weightList) {
    return [
      charts.Series<WeightData, DateTime>(
        id: 'Muscles',
        data: weightList,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (WeightData weightData, _) => weightData.date,
        measureFn: (WeightData weightData, _) => weightData.weight,
      )
    ];
  }
}
