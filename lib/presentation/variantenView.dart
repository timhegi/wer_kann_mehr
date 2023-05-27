import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:wer_kann_mehr/models/challenge.dart';
import 'package:wer_kann_mehr/models/variante.dart';
import 'package:wer_kann_mehr/services/challengeService.dart';
import 'package:wer_kann_mehr/services/variantenService.dart';

class EinzelneVariante extends StatefulWidget {
  const EinzelneVariante({Key? key}) : super(key: key);

  @override
  _EinzelneVarianteState createState() => _EinzelneVarianteState();
}

class _EinzelneVarianteState extends State<EinzelneVariante> {
  VariantenService variantenService = VariantenService();
  ChallengeService challengeService = ChallengeService();
  late Challenge challenge;

  late Variante variante;

  @override
  initState() {
    super.initState();

    variante = variantenService.filterActiveVariante();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          (variante.name.toString() == "zuhause")
              ? ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFE0E0E0),
                    BlendMode.saturation,
                  ),
                  child: SvgPicture.asset(
                    'assets/logos/wohnzimmer.svg',
                    width: MediaQuery.of(context).size.width,
                  ),
                )
              : ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFE0E0E0),
                    BlendMode.saturation,
                  ),
                  child: SvgPicture.asset(
                    'assets/logos/bar.svg',
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
          //: Text("Test"),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    variante.name.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 22),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 32, left: 32, right: 8),
                  child: Text(
                    variante.description.toString(),
                    //"Diese Variante ist nur mit Zettel und Stift spielbar",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: const Size(300, 80),
                      backgroundColor: const Color(0xFFD0E9B3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: const BorderSide(color: Colors.transparent)),
                    ),
                    onPressed: () {
                      challenge = challengeService.getRandomChallenge();
                      challengeService.setActiveChallenge(challenge);
                      challengeService.setPlayedChallenge(challenge);

                      Hive.box("navigationBarBox").put("challengeCounter", 0);
                      Hive.box("navigationBarBox")
                          .put("currentGameView", "challengeView");
                    },
                    child: Text(
                      "Jetzt spielen",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
