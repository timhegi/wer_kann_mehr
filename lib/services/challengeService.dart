import 'dart:math';

import 'package:hive/hive.dart';
import 'package:wer_kann_mehr/models/challenge.dart';
import 'package:wer_kann_mehr/models/challengeObjekt.dart';
import 'package:wer_kann_mehr/models/variante.dart';
import 'package:wer_kann_mehr/services/variantenService.dart';

class ChallengeService {
  List<ChallengeObjekt> createChallengeList() {
    List<ChallengeObjekt> challengeList = [];
    VariantenService variantenService = VariantenService();

    ChallengeObjekt shots = ChallengeObjekt(0, "Shots",
        "Wie viele Shots kannst Du hintereinander trinken?", "ü18", false);
    ChallengeObjekt anruf = ChallengeObjekt(
        1,
        "Anruf",
        "Wie viele Minuten kannst Du dich mit einer fremden Person am Telefon unterhalten? ",
        "ü18",
        false);

    ChallengeObjekt kleidung = ChallengeObjekt(2, "Kleidung",
        "Wie viele Kleidungsstücke ziehst Du aus?", "ü18", false);

    ChallengeObjekt edding = ChallengeObjekt(
        3,
        "Edding",
        "Wie viele Striche (einen Daumen lang) malst Du dir mit wasserfestem Edding ins Gesicht?",
        "ü18",
        false);

    ChallengeObjekt finger = ChallengeObjekt(4, "Finger",
        "Von wie vielen Mitspielern lutscht Du  einen Finger?", "ü18", false);

    ChallengeObjekt insta = ChallengeObjekt(
        5,
        "Insta",
        "Wie vielen deiner Follower auf Instagram würdest Du eine kurze Nachricht schreiben denen Du selber nicht folgst?",
        "ü18",
        false);

    ChallengeObjekt grimasse = ChallengeObjekt(
        6,
        "Grimasse",
        " Wie lange bleibst Du ernst, wenn Dir die Mitspieler Witze erzählen, Grimassen schneiden oder Geräusche von sich geben?",
        "bar",
        false);

    ChallengeObjekt luft = ChallengeObjekt(
        7, "Luft", "Wie lange kannst Du die Luft anhalten?", "bar", false);

    ChallengeObjekt laender = ChallengeObjekt(
        8,
        "Länder",
        "Wie viele Länder mit dem Anfangsbuchstaben K kannst Du innerhalb von 2 Minuten aufzählen?",
        "bar",
        false);

    ChallengeObjekt musik = ChallengeObjekt(
        9,
        "Musik",
        "Wie viele Songtitel kannst Du von dem Interpreten Z innerhalb von 2 Minuten aufzählen?",
        "bar",
        false);

    ChallengeObjekt reim = ChallengeObjekt(
        10,
        "Reim",
        "Wie viele Wörter kannst Du innerhalb von 2 Minuten hintereinander reimen?",
        "bar",
        false);

    ChallengeObjekt sitUp = ChallengeObjekt(11, "Situp",
        "Wie viele Sit-Ups schaffst Du hintereinander?", "bar", false);

    ChallengeObjekt liegestuetz = ChallengeObjekt(12, "Liegestütz",
        "Wie viele Liegestütze schaffst Du hintereinander?", "bar", false);

    ChallengeObjekt charakter = ChallengeObjekt(
        13,
        "Charakter",
        "Wie viele Charaktereigenschaften kannst Du innerhalb von 2 Minuten aufzählen?",
        "bar",
        false);

    ChallengeObjekt raetsel = ChallengeObjekt(
        14,
        "Rätsel",
        "In wie vielen Sekunden kannst Du das folgende Rätsel lösen?",
        "bar",
        false);

    ChallengeObjekt youtuber = ChallengeObjekt(
        15,
        "Youtuber",
        "Wie viele Youtuber kannst Du innerhalb von zwei Minuten mit dem Anfangsbuchstaben S aufzählen?",
        "bar",
        false);
    ChallengeObjekt emotion = ChallengeObjekt(
        16,
        "Emotion",
        "Wie viele Emotionen kannst Du innerhalb von 2 Minuten aufzählen?",
        "bar",
        false);

    ChallengeObjekt blind = ChallengeObjekt(
        17,
        "Blind",
        "Wie viele von 10 Dingen kannst Du mit verbundenen Augen erkennen?",
        "bar",
        false);

    ChallengeObjekt anmachspruch = ChallengeObjekt(
        18,
        "Anmachspruch",
        "Wie viele Anmachsprüche kannst Du in 2 Minuten aufsagen?",
        "bar",
        false);

    ChallengeObjekt blinde = ChallengeObjekt(
        19,
        "Blind",
        "Wie viele von 10 Dingen kannst Du mit verbundenen Augen erkennen?",
        "bar",
        false);
    ChallengeObjekt potter = ChallengeObjekt(
        20,
        "Potter",
        "Wie viele Harry Potter Charaktere kannst Du innerhalb von zwei Minuten aufzählen?",
        "bar",
        false);

    ChallengeObjekt blinzeln = ChallengeObjekt(21, "Blinzeln",
        "Wie lange kannst du die Augen ohne Blinzeln Aufhalten?", "bar", false);

    ChallengeObjekt glas = ChallengeObjekt(
        22,
        "Glas",
        "Wie lange kannst du ein volles Glas Wasser mit ausgestrecktem Arm halten?",
        "bar",
        false);

    ChallengeObjekt wandsitzen = ChallengeObjekt(
        23,
        "Wandsitzen",
        "Wie lange kannst Du an der Wand sitzen? (Beine in einem 90 Grad Winkel)",
        "bar",
        false);

    ChallengeObjekt plank = ChallengeObjekt(
        24, "Plank", "Wie lange kannst du Planken?", "bar", false);

    ChallengeObjekt muenze = ChallengeObjekt(
        25,
        "Münze",
        "Wie lange kannst du eine Münze sich drehen lassen ohne das Sie stehen bleibt?",
        "bar",
        false);

    ChallengeObjekt bundesland = ChallengeObjekt(
        26,
        "Bundesland",
        "Wie viele Bundesländer Deutschlands kannst du in zwei Minuten aufzählen?",
        "bar",
        false);

    ChallengeObjekt land = ChallengeObjekt(
        27,
        "Land",
        " Wie viele Länder mit dem Anfangsbuchstaben B kannst du innerhalb von zwei Minuten aufzählen?",
        "bar",
        false);

    ChallengeObjekt stadt = ChallengeObjekt(
        28,
        "Stadt",
        "Wie viele deutsche Städte (Min. 10.000 Einwohner) mit dem Anfangsbuchstaben B kannst du innerhalb von zwei Minuten aufzählen?",
        "bar",
        false);

    ChallengeObjekt fluss = ChallengeObjekt(
        29,
        "Fluss",
        "Wie viele Flüsse mit dem Anfangsbuchstaben H kannst du innerhalb von zwei Minuten aufzählen?",
        "bar",
        false);

    ChallengeObjekt lachen = ChallengeObjekt(
        30,
        "Lachen",
        "Wie viele Mitspieler bringst du mit einem/r Gag/Aktion zum Lachen?",
        "bar",
        false);

    ChallengeObjekt handstand = ChallengeObjekt(31, "Handstand",
        "Wie lange kannst Du einen Handstand ohne Hilfe halten?", "bar", false);

    ChallengeObjekt wurstwasser = ChallengeObjekt(
        32,
        "Wurstwasser",
        "Wie viele Shots Wurstwasser kannst Du hintereinander trinken?",
        "zuhause",
        false);

    ChallengeObjekt toastbrot = ChallengeObjekt(
        33,
        "Toastbrot",
        " Wie viele Toastbrothälften kannst Du innerhalb von zwei Minuten essen? ",
        "zuhause",
        false);

    ChallengeObjekt stapeln = ChallengeObjekt(
        34,
        "Stapeln",
        "Wie viele Würfel kannst Du übereinander stapeln ohne das sie auf den Boden fallen? (Die gestapelten Würfel müssen mindestens 5 Sekunden in die Luft gehalten werden)",
        "zuhause",
        false);

    ChallengeObjekt Karten = ChallengeObjekt(
        35,
        "Karten",
        "Wie viele Karten kannst du Dir innerhalb von zwei Minuten merken und danach in der richtigen Reihenfolge aufsagen?",
        "zuhause",
        false);

    ChallengeObjekt salz = ChallengeObjekt(
        36,
        "Salz",
        "Wie viele Teelöffel Salz kannst Du hintereinander innerhalb von fünf Minuten essen?",
        "zuhause",
        false);

    ChallengeObjekt papierflieger = ChallengeObjekt(37, "Papierflieger",
        "Wie weit fliegt Dein selbstgebauter Papierflieger?", "zuhause", false);

    ChallengeObjekt ketchup = ChallengeObjekt(
        38,
        "Ketchup",
        "Wie viele Teelöffel Ketchup kannst Du innerhalb von zwei Minuten hintereinander essen?",
        "zuhause",
        false);

    ChallengeObjekt flasche = ChallengeObjekt(
        39,
        "Flasche",
        "Wie lange kannst Du eine 1,5 Liter gefüllte Wasserflasche mit ausgestrecktem Arm nach vorne halten?",
        "zuhause",
        false);

    ChallengeObjekt ton = ChallengeObjekt(
        40, "Ton", "Wie lange kannst Du den Ton “A” halten?", "zuhause", false);

    ChallengeObjekt springen = ChallengeObjekt(
        41,
        "Springen",
        "Wie viele Seilsprünge schaffst Du innerhalb von zwei Minuten? ",
        "zuhause",
        false);

    ChallengeObjekt seilsprung = ChallengeObjekt(
        42,
        "Seilsprung",
        "Wie viele Seilsprünge schaffst Du hintereinander ohne Fehler?",
        "zuhause",
        false);

    ChallengeObjekt darts = ChallengeObjekt(
        43,
        "Darts",
        "Wie viele Versuche benötigst Du auf einer handelsüblichen Dartscheibe die Double 20 zu treffen?",
        "zuhause",
        false);

    ChallengeObjekt kartenhaus = ChallengeObjekt(
        44,
        "Kartenhaus",
        "Wie viele Ebenen kannst du mit einem Kartenhaus bauen?",
        "zuhause",
        false);

    ChallengeObjekt lesen = ChallengeObjekt(
        45,
        "Lesen",
        "Wie schnell kannst du eine Buchseite eines DIN A5 großen Buches fehlerfrei und laut vorlesen?",
        "zuhause",
        false);

    ChallengeObjekt Kartenhaus = ChallengeObjekt(
        46,
        "Kartenhaus",
        "Wie viele Ebenen kannst du mit einem Kartenhaus bauen?",
        "zuhause",
        false);

    ChallengeObjekt marshmallow = ChallengeObjekt(
        47,
        "Marshmallow",
        "Wie viele Marshmallows kannst du dir auf einmal in den Mund schieben?",
        "zuhause",
        false);

    ChallengeObjekt bottleflip = ChallengeObjekt(
        48,
        "Bottleflip",
        "Wie viele Bottleflips kannst du fehlerfrei hintereinander machen?",
        "zuhause",
        false);

    ChallengeObjekt beerpong = ChallengeObjekt(
        49,
        "Beerpong",
        "Wie viele Tischtennisbälle kannst Du hintereinander in einen Beerpongbecher werfen (10 Beerpongbecher werden auf einem handelsüblichen Beerpongtisch aufgebaut)?",
        "zuhause",
        false);

    ChallengeObjekt stift = ChallengeObjekt(
        50,
        "Stift",
        "Wie viele Stifte kannst Du hochwerfen und dann mit einer Hand wieder auffangen?",
        "zuhause",
        false);

    ChallengeObjekt dosen = ChallengeObjekt(
        51,
        "Dosen",
        "Wie viele Bierdose/Limodosen kannst Du aufeinanderstapeln?",
        "zuhause",
        false);

    challengeList.add(shots);
    challengeList.add(anruf);
    challengeList.add(kleidung);
    challengeList.add(edding);
    challengeList.add(finger);
    challengeList.add(insta);
    challengeList.add(grimasse);
    challengeList.add(luft);
    challengeList.add(laender);
    challengeList.add(musik);
    challengeList.add(reim);
    challengeList.add(sitUp);
    challengeList.add(liegestuetz);
    challengeList.add(charakter);
    challengeList.add(raetsel);
    challengeList.add(youtuber);
    challengeList.add(blinde);
    challengeList.add(potter);
    challengeList.add(blinzeln);
    challengeList.add(glas);
    challengeList.add(wandsitzen);
    challengeList.add(plank);
    challengeList.add(muenze);
    challengeList.add(bundesland);
    challengeList.add(land);
    challengeList.add(stadt);
    challengeList.add(fluss);
    challengeList.add(lachen);
    challengeList.add(handstand);
    challengeList.add(wurstwasser);
    challengeList.add(toastbrot);
    challengeList.add(stapeln);
    challengeList.add(Karten);
    challengeList.add(salz);
    challengeList.add(papierflieger);
    challengeList.add(ketchup);
    challengeList.add(flasche);
    challengeList.add(ton);
    challengeList.add(springen);
    challengeList.add(seilsprung);
    challengeList.add(darts);
    challengeList.add(kartenhaus);
    challengeList.add(lesen);
    challengeList.add(Kartenhaus);
    challengeList.add(marshmallow);
    challengeList.add(bottleflip);
    challengeList.add(beerpong);
    challengeList.add(stift);
    challengeList.add(dosen);

    return challengeList;
  }

  fillHiveBox() async {
    Box challengeBox = await Hive.box<Challenge>("challengeBox");
    List<ChallengeObjekt> challengeList = createChallengeList();

    for (var element in challengeList) {
      await challengeBox.put(
          element.id,
          Challenge(
              id: element.id,
              name: element.title,
              description: element.description,
              variante: element.variante,
              active: element.active,
              played: false));
    }
  }

  setPlayedChallenge(Challenge challenge) {
    challenge.played = true;
    Hive.box<Challenge>("challengeBox").put(challenge.id, challenge);
  }

  setActiveChallenge(Challenge challenge) {
    challenge.active = true;
    Hive.box<Challenge>("challengeBox").put(challenge.id, challenge);
  }

  deletePlayed() {
    while (true) {
      if (Hive.box<Challenge>("challengeBox")
          .values
          .where((element) => element.played == true)
          .isNotEmpty) {
        Challenge challenge = Hive.box<Challenge>("challengeBox")
            .values
            .where((element) => element.played == true)
            .first;

        challenge.played = false;
        Hive.box<Challenge>("challengeBox").put(challenge.id, challenge);
      } else {
        break;
      }
    }
  }

  filterActiveChallenge() {
    Box challengeBox = Hive.box<Challenge>("challengeBox");

    var challenge =
        challengeBox.values.where((element) => element.active == true);



    return challenge;
  }

  getRandomChallenge() {
    var activeVariante = Hive.box<Variante>("variantenBox")
        .values
        .where((element) => element.active == true)
        .first;

    int challengeLength = Hive.box<Challenge>("challengeBox")
        .values
        .where((element) => element.variante == activeVariante.name)
        .length;

    var intValue = Random().nextInt(challengeLength);

    List<Challenge> challengeList = Hive.box<Challenge>("challengeBox")
        .values
        .where((element) => element.variante == activeVariante.name.toString())
        .toList();

    Challenge challenge = challengeList.elementAt(intValue);

    return challenge;
  }

  deleteActiveChallenge() {
    if (Hive.box<Challenge>("challengeBox")
        .values
        .where((element) => element.active == true)
        .isNotEmpty) {
      Challenge challenge = Hive.box<Challenge>("challengeBox")
          .values
          .where((element) => element.active == true)
          .first;

      challenge.active = false;

      Hive.box<Challenge>("challengeBox").put(challenge.id, challenge);
    } else {
      return;
    }
  }
}
