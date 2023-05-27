import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Shuffle extends StatefulWidget {
  const Shuffle({Key? key}) : super(key: key);

  @override
  _ShuffleState createState() => _ShuffleState();
}

class _ShuffleState extends State<Shuffle> {
  Timer? timer;
  List<String> numberList = [
    "1111",
    "2222",
    "3333",
    "4444",
    "5555",
    "6666",
    "7777",
    "8888",
    "9999",
    "1000"
  ];
  String _current = "";

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 4), (Timer t) => _shuffle());
    super.initState();
  }

  void _shuffle() {
    String item = "";

    if (numberList.isNotEmpty) {
      numberList.shuffle();
      item = numberList.removeLast();
      setState(() {
        _current = item;
      });
      print(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: Text(
          _current,
          key: ValueKey(_current),
          style: TextStyle(
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)]),
        ),
      ),
    );
  }
}
