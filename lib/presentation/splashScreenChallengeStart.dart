import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wer_kann_mehr/presentation/homepage.dart';

class SplashScreenChallengeStart extends StatefulWidget {
  const SplashScreenChallengeStart({Key? key}) : super(key: key);

  @override
  _SplashScreenChallengeStartState createState() =>
      _SplashScreenChallengeStartState();
}

class _SplashScreenChallengeStartState
    extends State<SplashScreenChallengeStart> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0D6788),
              Color(0xFFB2D094),
              Color(0xFFD7C8D2)
            ],
            stops: [0, 1, 1],
            begin: AlignmentDirectional(0, -1),
            end: const AlignmentDirectional(0, 1),
          ),
        ),

        child: SvgPicture.asset('assets/logos/wer_kann_mehr_logo.svg'));
  }
}
