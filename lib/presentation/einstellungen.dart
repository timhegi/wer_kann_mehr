import 'package:flutter/material.dart';
import 'package:wer_kann_mehr/models/challengeObjekt.dart';

const List<String> list = <String>['Spielvorbereitung', 'Two', 'Three', 'Four'];

class Einstellungen extends StatefulWidget {
  const Einstellungen({Key? key}) : super(key: key);

  @override
  _EinstellungenState createState() => _EinstellungenState();
}

class _EinstellungenState extends State<Einstellungen> {
  //List

  //ChallengeObjekt challengeName = ChallengeObjekt(0, "Papierflieger", "test123", "sitIn");
  //VariantenObjekt variantenName = VariantenObjekt(0, "Papierflieger", "test123", "sitIn");

  //List list = List();
  //list.add(chal)



  late String currentValue = 'zielDesSpiels';

  String dropdownValue = list.first;

  getDropdownText(String value) {
    if (value == "Spielvorbereitung") {
      return Text(
          "Zu Beginn jeder Variante werden die benötigten Dinge vorgestellt. Für Diejenigen unter Euch, die nichts da haben gibt es die Variante “Bar”. Diese Variante muss aber nicht zwingendermaßen in einer Bar gespielt werden. Du kannst “Wer kann mehr...?” mit beliebig vielen Mitspielern aber mindestens zu Zweit spielen. Anfangs wird ein Master ausgewählt, der die Challenges vorliest und gegebenenfalls einen Timer stellt. Jeder Mitspieler braucht einen Stift und ein Papier.");
    } else return Text("");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Einstellungen',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          /*DropdownButton<String>(
            value: dropdownValue,
            hint: Text("Test"),
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),*/
          //Text(getDropdownText(dropdownValue)),
        ],
      ),
    );
  }
}
