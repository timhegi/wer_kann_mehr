import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wer_kann_mehr/presentation/challengeView.dart';
import 'package:wer_kann_mehr/presentation/einstellungen.dart';
import 'package:wer_kann_mehr/presentation/mainMenu.dart';
import 'package:wer_kann_mehr/presentation/spielregeln.dart';
import 'package:wer_kann_mehr/presentation/variantenView.dart';
import 'package:wer_kann_mehr/presentation/widgets/currentGame/noGameStarted.dart';
import 'package:wer_kann_mehr/services/variantenService.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageWidgetState createState() => HomePageWidgetState();
}

class HomePageWidgetState extends State<HomePage> {
  VariantenService variantenService = VariantenService();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Warnung"),
              content: Text(
                  "Alkohol sollte immer in geeigneten Mengen konsumiert werden"),
              actions: [
                TextButton(
                    child: Text('Ok'),
                    onPressed: () {
                      // Hier passiert etwas
                      Navigator.of(context).pop();
                    }),
              ],
            ));
  }

  setAppStartedFalse() {
    Hive.box("navigationBarBox").put("appStarted", false);
  }

  @override
  Widget build(BuildContext context) {
    (Hive.box("navigationBarBox").get("appStarted") == true)
        ? Future.delayed(Duration.zero, () {
            //showAlert(context);
            setAppStartedFalse();
          })
        : null;

    return ValueListenableBuilder(
      valueListenable: Hive.box("navigationBarBox").listenable(),
      builder: (BuildContext context, value, Widget? child) {
        void _onItemTapped(int index) {
          Hive.box("navigationBarBox").put("currentItem", index);
        }

        Widget checkHiveBox() {
          if (Hive.box("navigationBarBox").get("currentItem") == 0) {
            return MainMenu();
          } else if (Hive.box("navigationBarBox").get("currentItem") == 1) {
            if (Hive.box("navigationBarBox").get("currentGameView") ==
                "noGameStarted") {
              return NoGameStarted();
            } else if (Hive.box("navigationBarBox").get("currentGameView") ==
                "variantenView") {
              return EinzelneVariante();
            } else if (Hive.box("navigationBarBox").get("currentGameView") ==
                "challengeView") {
              if (Hive.box("navigationBarBox").get("challengeCounter") <= 9) {
                return ChallengeView();
              } else {
                return NoGameStarted();
              }
            } else
              return Text("Error");
          } else if (Hive.box("navigationBarBox").get("currentItem") == 2) {
            return Spielregeln();
          } else {
            return Einstellungen();
          }
        }

        return Scaffold(
          body: Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                checkHiveBox(),
                /*_widgetOptions
                    .elementAt(Hive.box("navigationBarBox").get("currentItem")),*/
                BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Menü',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.videogame_asset),
                      label: 'Runde',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.book),
                      label: 'Spielanleitung',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Einstellungen',
                    ),
                  ],
                  currentIndex: Hive.box("navigationBarBox").get("currentItem"),
                  //_selectedIndex,
                  selectedItemColor: Colors.amber[800],
                  onTap: _onItemTapped,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
