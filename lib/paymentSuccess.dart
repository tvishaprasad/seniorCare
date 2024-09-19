import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:registration/requestAgainAnimation.dart';

void main() {
  runApp(PaymentSuccess());
}

class PaymentSuccess extends StatefulWidget {
  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  bool _playAnimation = false;
  double _textOpacity = 0.0; // Initialize the text opacity to 0

  @override
  void initState() {
    super.initState();
    _playSound();
  }

 _playSound() {
    _assetsAudioPlayer.open(
      Audio("assets/success.mp3"),
      autoStart: true,
    );

    Future.delayed(Duration(seconds: 0), () {
      setState(() {
        _playAnimation = true;
      });
      Future.delayed(Duration(milliseconds: 400), () {
      // Assuming the Lottie animation takes 3 seconds
      setState(() {
        _textOpacity = 1.0; // Set opacity to 1 to make the text visible
      });
    });

      // Add code to navigate to the new page after 2 seconds
      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => RequestAgain(),
          ),
        );
      });
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
              _playAnimation
              ? Lottie.asset(
                  'assets/payment.json',
                  repeat: false,
                  width: 400,
                  height: 400,
                  fit: BoxFit.contain,
                )
              : Container(),  // Display an empty container before the animation starts

              // AnimatedOpacity widget for the fade-in effect
              AnimatedOpacity(
                duration:
                    Duration(seconds: 1), // Duration for the fade-in effect
                opacity: _textOpacity,
                child: Text(
                  "Payment Success",
                  style: TextStyle(
                    fontSize: 32.0, // Adjusted to make the font bigger
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
