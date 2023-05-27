import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wer_kann_mehr/models/challenge.dart';
import 'package:wer_kann_mehr/presentation/splashScreenChallengeStart.dart';
import 'package:wer_kann_mehr/services/challengeService.dart';
import 'package:wer_kann_mehr/services/variantenService.dart';

class ChallengeView extends StatefulWidget {
  const ChallengeView({Key? key}) : super(key: key);

  @override
  _ChallengeViewState createState() => _ChallengeViewState();
}

class _ChallengeViewState extends State<ChallengeView> {
  VariantenService variantenService = VariantenService();
  ChallengeService challengeService = ChallengeService();
  late Challenge challenge;

  int counter = 0;

  /*void _setChallenge() {
    print("setChallenge");

    challenge = challengeService.getRandomChallenge();
    while (challenge.played == true) {
      print(challenge.name.toString());
      challenge = challengeService.getRandomChallenge();
    }

    challengeService.setActiveChallenge(challenge);
    challengeService.setPlayedChallenge(challenge);

    Hive.box("navigationBarBox").put("currentGameView", "challengeView");
  }*/

  /*void _shuffle() {
    String item = "";

    if (challengeList.isNotEmpty) {
      challengeList.shuffle();
      item = challengeList.removeLast();

      setState(() {
        _current = item;
        counter++;
      });

      print(item);
    }
  }*/

  /*void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }*/

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: 30, bottom: 30),
            child: Text(
              challengeService.filterActiveChallenge().first.name.toString(),
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              challengeService
                  .filterActiveChallenge()
                  .first
                  .description
                  .toString(),
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          (Hive.box("navigationBarBox").get("challengeCounter") == 7)
              ? Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: const Size(300, 80),
                      backgroundColor: const Color(0xFFD0E9B3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: const BorderSide(color: Colors.transparent)),
                    ),
                    onPressed: () {
                      variantenService.deleteActiveVariante();
                      challengeService.deleteActiveChallenge();
                      Hive.box("navigationBarBox").put("currentItem", 0);
                      Hive.box("navigationBarBox").put("challengeCounter", 0);
                      Hive.box("navigationBarBox")
                          .put("currentGameView", "noGameStarted");
                      challengeService.deletePlayed();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SplashScreenChallengeStart()),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "Spiel beenden",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: const Size(300, 80),
                      backgroundColor: const Color(0xFFD0E9B3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: const BorderSide(color: Colors.transparent)),
                    ),
                    onPressed: () {
                      int challengeCouter =
                          Hive.box("navigationBarBox").get("challengeCounter");
                      challengeCouter++;
                      Hive.box("navigationBarBox")
                          .put("challengeCounter", challengeCouter);
                      if (Hive.box("navigationBarBox")
                              .get("challengeCounter") <=
                          7) {
                        challengeService.deleteActiveChallenge();

                        challenge = challengeService.getRandomChallenge();
                        challengeService.setActiveChallenge(challenge);
                        challengeService.setPlayedChallenge(challenge);
                      } else {
                        variantenService.deleteActiveVariante();
                        challengeService.deleteActiveChallenge();
                        Hive.box("navigationBarBox").put("currentItem", 0);
                        Hive.box("navigationBarBox").put("challengeCounter", 0);
                      }
                    },
                    child: const Center(
                      child: Text(
                        "Nächste Challenge",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
