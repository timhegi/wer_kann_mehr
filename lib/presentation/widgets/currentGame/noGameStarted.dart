import 'package:flutter/material.dart';

class NoGameStarted extends StatefulWidget {
  const NoGameStarted({Key? key}) : super(key: key);

  @override
  _NoGameStartedState createState() => _NoGameStartedState();
}

class _NoGameStartedState extends State<NoGameStarted> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: Center(
            child: Text(
      "Kein Spiel gestartet",
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
    )));
  }
}
