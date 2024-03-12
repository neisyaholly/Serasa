import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:serasa/pages/login.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });

    _controller = VideoPlayerController.asset("assets/videos/logo.mp4")
      ..initialize().then((value) => {setState(() {})});
    _controller.setLooping(false);
    _controller.setVolume(0.0);
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFFFFEF8),
        body: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: _controller.value.isPlaying ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 500),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ],
        )
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
