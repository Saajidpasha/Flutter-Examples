import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildContainer(Colors.red,'note1.wav'),
                buildContainer(Colors.grey,'note2.wav'),
                buildContainer(Colors.orange,'note3.wav'),
                buildContainer(Colors.green,'note4.wav'),
                buildContainer(Colors.pink,'note5.wav'),
                buildContainer(Colors.blue,'note6.wav'),
                buildContainer(Colors.yellow,'note7.wav'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildContainer(Color color, String note) {
    return Expanded(
        child: FlatButton(
           color: color,
        child: Text(''),
        onPressed: (){
          final player = AudioCache();
          player.play(note);
        },
      ),
    );
  }
}
