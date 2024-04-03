import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'xylphone',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue.shade300,
        ),
        body: const SafeArea(
          child: AudioPlayBlock(),
        ),
      ),
    );
  }
}

class AudioPlayBlock extends StatelessWidget {
  const AudioPlayBlock({
    super.key,
  });

  // 播放声音
  Future<void> playSound(int note) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$note.mp3'));
  }

  // 单个组件
  Expanded buildKey(int note) {
    List<Color> colorList = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.purple
    ];
    List<String> noteTextList = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
    return Expanded(
      child: Container(
        color: colorList[note - 1],
        width: 100.0,
        child: TextButton(
          onPressed: () async {
            playSound(note);
          },
          child: Text(
            noteTextList[note - 1],
            style: const TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  // 组件列表
  List<Widget> getNoteList() {
    List<Widget> noteList = [];
    for (int i = 0; i < 7; i++) {
      noteList.add(buildKey(i + 1));
    }
    return noteList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: getNoteList(),
    );
  }
}
