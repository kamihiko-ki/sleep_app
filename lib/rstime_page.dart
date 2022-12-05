import 'package:flutter/material.dart';

class RstimePage extends StatefulWidget {
  const RstimePage({super.key});

  @override
  State<RstimePage> createState() => _RstimePageState();
}

class _RstimePageState extends State<RstimePage> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ひつようなすいみんじかん'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Text(selectedTime != null
                ? "${selectedTime!.hour}:${selectedTime!.minute}"
                : "Time"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => _pickTime(context),
                child: const Text("Pick Date"))
          ],
        ),
      ),
    );
  }

  Future _pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 10, minute: 0);

    final newTime =
        await showTimePicker(context: context, initialTime: initialTime);

    if (newTime != null) {
      setState(() => selectedTime = newTime);
    } else {
      return;
    }
  }
}
