import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource("note$soundNumber.wav"));
  }

  Expanded buildKey({required int soundNumber, required Color color}) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: WidgetStateProperty.all(color)),
        onPressed: () {
          playSound(soundNumber);
        },
        child: const SizedBox.shrink(), // kein Text, nur farbiger Balken
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(soundNumber: 1, color: Colors.red),
                buildKey(soundNumber: 2, color: Colors.orange),
                buildKey(soundNumber: 3, color: Colors.yellow),
                buildKey(soundNumber: 4, color: Colors.green),
                buildKey(soundNumber: 5, color: Colors.teal),
                buildKey(soundNumber: 6, color: Colors.blue),
                buildKey(soundNumber: 7, color: Colors.purple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
