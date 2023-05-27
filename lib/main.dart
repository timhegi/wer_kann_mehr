import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wer_kann_mehr/models/challenge.dart';
import 'package:wer_kann_mehr/models/variante.dart';
import 'package:wer_kann_mehr/presentation/homepage.dart';
import 'package:wer_kann_mehr/presentation/splashScreenChallengeStart.dart';
import 'package:wer_kann_mehr/services/challengeService.dart';
import 'package:wer_kann_mehr/services/variantenService.dart';

void main() async {
  //Test123
  VariantenService variantenService = VariantenService();
  ChallengeService challengeService = ChallengeService();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  Hive.registerAdapter(VarianteAdapter());
  Hive.registerAdapter(ChallengeAdapter());

  await Hive.openBox<Variante>("variantenBox");
  await Hive.openBox<Challenge>("challengeBox");
  Box navigationBarBox = await Hive.openBox("navigationBarBox");
  navigationBarBox.put("appStarted", true);

  if (navigationBarBox.isEmpty) {
    navigationBarBox.put("currentItem", 0);
    navigationBarBox.put("currentGameView", "noGameStarted");
    navigationBarBox.put("challengeCounter", 0);

  }

  if (Hive.box<Challenge>("challengeBox").isEmpty) {
    challengeService.fillHiveBox();
  }

  if (Hive.box<Variante>("variantenBox").isEmpty) {
    variantenService.fillHiveBox();
  }

  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
}

class MyApp extends StatelessWidget {
  String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: _title,
      home: SplashScreenChallengeStart()//HomePage(),
    );
  }
}
