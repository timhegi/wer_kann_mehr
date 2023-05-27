import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wer_kann_mehr/models/variante.dart';
import 'package:wer_kann_mehr/presentation/variantenView.dart';
import 'package:wer_kann_mehr/presentation/homepage.dart';
import 'package:wer_kann_mehr/services/challengeService.dart';
import 'package:wer_kann_mehr/services/variantenService.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  HomePage hPage = HomePage();

  VariantenService variantenService = VariantenService();
  ChallengeService challengeService = ChallengeService();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box("navigationBarBox").listenable(),
      builder: (BuildContext context, value, Widget? child) {
        if (Hive.box("navigationBarBox").get("currentItem") == 0) {
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                  child: Center(
                    child: Text(
                      "Varianten",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              fixedSize: const Size(120, 80),
                              backgroundColor: const Color(0xFFD0E9B3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: const BorderSide(
                                      color: Colors.transparent)),
                            ),
                            onPressed: () {
                              if (Hive.box<Variante>("variantenBox")
                                  .values
                                  .where((element) => element.active == true)
                                  .isNotEmpty) {
                                Hive.box<Variante>("variantenBox")
                                    .values
                                    .where((element) => element.active == true)
                                    .first
                                    .active = false;
                              }

                              variantenService.setVarianteActive("bar");
                              Hive.box("navigationBarBox")
                                  .put("currentItem", 1);
                              Hive.box("navigationBarBox")
                                  .put("currentGameView", "variantenView");
                            },
                            child: const Center(
                              child: Text(
                                'Bar',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              fixedSize: const Size(120, 80),
                              backgroundColor: const Color(0xFFD0E9B3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: const BorderSide(
                                      color: Colors.transparent)),
                            ),
                            onPressed: () {
                              if (Hive.box<Variante>("variantenBox")
                                  .values
                                  .where((element) => element.active == true)
                                  .isNotEmpty) {
                                Hive.box<Variante>("variantenBox")
                                    .values
                                    .where((element) => element.active == true)
                                    .first
                                    .active = false;
                              }
                              variantenService.setVarianteActive("zuhause");
                              Hive.box("navigationBarBox")
                                  .put("currentItem", 1);
                              Hive.box("navigationBarBox")
                                  .put("currentGameView", "variantenView");
                            },
                            child: const Center(
                              child: Text(
                                "Zu hause",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              fixedSize: const Size(120, 80),
                              backgroundColor: const Color(0xFFD0E9B3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: const BorderSide(
                                      color: Colors.transparent)),
                            ),
                            onPressed: () {
                              if (Hive.box<Variante>("variantenBox")
                                  .values
                                  .where((element) => element.active == true)
                                  .isNotEmpty) {
                                Hive.box<Variante>("variantenBox")
                                    .values
                                    .where((element) => element.active == true)
                                    .first
                                    .active = false;
                              }
                              variantenService.setVarianteActive("ü18");
                              Hive.box("navigationBarBox")
                                  .put("currentItem", 1);
                              Hive.box("navigationBarBox")
                                  .put("currentGameView", "variantenView");
                            },
                            child: const Center(
                              child: Text(
                                "Ü18",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              fixedSize: const Size(120, 80),
                              backgroundColor: const Color(0xFFD0E9B3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: const BorderSide(
                                      color: Colors.transparent)),
                            ),
                            onPressed: () {},
                            child: const Center(
                              child: Text(
                                "Gesperrt",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              fixedSize: const Size(120, 80),
                              backgroundColor: const Color(0xFFD0E9B3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: const BorderSide(
                                      color: Colors.transparent)),
                            ),
                            onPressed: () {},
                            child: const Center(
                              child: Text(
                                "Gesperrt",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              fixedSize: const Size(120, 80),
                              backgroundColor: const Color(0xFFD0E9B3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: const BorderSide(
                                      color: Colors.transparent)),
                            ),
                            onPressed: () {},
                            child: const Center(
                              child: Text(
                                "Gesperrt",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return EinzelneVariante();
        }
      },
    );
  }
}
