import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  var color;
  Widget buttonKey(int soundNumber) {
    soundNumber = soundNumber % 7;
    List colorList = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.lightGreen,
      Colors.green,
      Colors.blue,
      Colors.purple,
    ];
    return Expanded(
      child: FlatButton(
        color: colorList[soundNumber],
        onPressed: () {
          final player = AudioCache();
          player.play('note${soundNumber + 1}.wav');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(7, (index) => buttonKey(index)),
          ),
        ),
      ),
    );
  }
}
