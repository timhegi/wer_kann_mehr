import 'package:flutter/material.dart';

class ZielDesSpiels extends StatefulWidget {
  const ZielDesSpiels({Key? key}) : super(key: key);

  @override
  _ZielDesSpielsState createState() => _ZielDesSpielsState();
}

class _ZielDesSpielsState extends State<ZielDesSpiels> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.all(30),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                color: Color(0xFFACABAB),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 10, top: 30),
                    child: Text(
                      'Ziel des Spiels',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      '...',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
