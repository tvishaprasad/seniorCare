import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:registration/seniorUserHomePage.dart';
import 'package:registration/yourCaregiver.dart';

void main() {
  runApp(RequestAgain());
}

class RequestAgain extends StatefulWidget {
  @override
  _RequestAgainState createState() => _RequestAgainState();
}

class _RequestAgainState extends State<RequestAgain> {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  //bool _playAnimation = true; // Start the animation immediately
  double _textOpacity = 0.0; // Initialize the text opacity to 0

  @override
  void initState() {
    super.initState();
    _playSound();
    _setTextDelay();
  }

  _playSound() {
    Future.delayed(Duration(milliseconds: 560), () {
      // Assuming the Lottie animation takes 3 seconds

      _assetsAudioPlayer.open(
        Audio("assets/swoosh.mp3"),
        autoStart: true,
      );
    });
  }

  _setTextDelay() {
    Future.delayed(Duration(seconds: 2), () {
      // Assuming the Lottie animation takes 3 seconds
      setState(() {
        _textOpacity = 1.0; // Set opacity to 1 to make the text visible
      });
    });
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    });
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/swooshh.json',
                repeat: false,
                width: 400,
                height: 400,
                fit: BoxFit.contain,
              ),

              // AnimatedOpacity widget for the fade-in effect
              AnimatedOpacity(
                duration:
                    Duration(seconds: 1), // Duration for the fade-in effect
                opacity: _textOpacity,
                child: Text(
                  "Request Sent",
                  style: TextStyle(
                    fontSize: 32.0, // Adjusted to make the font bigger
                    fontWeight: FontWeight.bold,
                    color:
                        Color(0xFF25a555), // Set the color to Color(0xFF25a555)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
