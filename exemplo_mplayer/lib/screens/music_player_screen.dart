import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:exemplo_mplayer/models/music_model.dart';

class MusicPlayerScreen extends StatefulWidget {
  final MusicModel music;

  const MusicPlayerScreen({Key? key, required this.music}) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _audio;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audio = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.music.url;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.music.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.skip_previous),
              onPressed: () {
              },
              iconSize: 50,
            ),
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: () {
                if (isPlaying) {
                  _audio.pause();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  _audio.play(UrlSource(url));
                  setState(() {
                    isPlaying = true;
                  });
                }
              },
              iconSize: 50,
            ),
            IconButton(
              icon: Icon(Icons.skip_next),
              onPressed: () {
              },
              iconSize: 50,
            ),
          ],
        ),
      ),
    );
  }
}
