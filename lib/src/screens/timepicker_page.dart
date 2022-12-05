import 'package:flutter/material.dart';
import 'package:sleep_app/src/screens/bed_page.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _timeOfDay.format(context),
              style: Theme.of(context).textTheme.headline2,
            ),
            TextButton(
              child: const Text(
                'edit',
                style: TextStyle(
                    decoration: TextDecoration
                        .underline), //constは黄色い波線のときに、もう変える気はないですよと鍵をかけたり、するイメージ。または、大丈夫？という波線に対して、断言して波線を消すイメージ。constとfinalは定数。
              ),
              onPressed: () async {
                final TimeOfDay? timeOfDay = await showTimePicker(
                    context: context, initialTime: _timeOfDay);
                if (timeOfDay != null) setState(() => {_timeOfDay = timeOfDay});
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
                  '起きるなら',
                  style: TextStyle(fontSize: 15),
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
                        bedTime: _timeOfDay, //importは雷マークで更新してから出る。
                      ),
                    ),
                  );
                },
                child: const Text(
                  '眠るなら',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
