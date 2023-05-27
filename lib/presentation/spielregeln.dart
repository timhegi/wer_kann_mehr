import 'package:flutter/material.dart';

class Spielregeln extends StatefulWidget {
  const Spielregeln({Key? key}) : super(key: key);

  @override
  _SpielregelnState createState() => _SpielregelnState();
}

class _SpielregelnState extends State<Spielregeln> {
  String _chosenValue = "Spielvorbereitung";

  String spielvorbereitung = "Zu Beginn jeder Variante werden die benötigten Dinge vorgestellt. Für Diejenigen unter Euch, die nichts da haben gibt es die Variante “Bar”. Diese Variante muss aber nicht zwingendermaßen in einer Bar gespielt werden. Du kannst “Wer kann mehr...?” mit beliebig vielen Mitspielern aber mindestens zu Zweit spielen. Anfangs wird ein Master ausgewählt, der die Challenges vorliest und gegebenenfalls einen Timer stellt. Jeder Mitspieler braucht einen Stift und ein Papier.";
  String spielverlauf = "Zu Beginn wird eine Variante ausgewählt. Durch Zufallsprinzip werden 8 Challenges ausgewählt. Jeder Mitspieler schreibt vor jeder Challengerunde verdeckt auf wie viel er/sie schafft. Derjenige der am meisten geschätzt hat muss in der Challenge seine geschätzte Anzahl schaffen. Schafft der Mitspieler die Challenge bekommt er einen Punkt. Falls Dieser es nicht schafft ist Derjenige dran der am zweitmeisten geschätzt hat und so weiter. Wichtig: Jeder Mitspieler muss nur so viel machen wie er/Sie aufgeschrieben hat.";
  String spielBeispiel = "Challenge: Wie viele Liegestütze schaffst Du in zwei Minuten? Spieler x schreibt 20 Liegestütze auf Spieler y schreibt 10 Liegestütze auf Spieler z schreibt 5 Liegestütze auf Spieler x hat die höchste Anzahl an Liegestützen aufgeschrieben und traut sich somit mehr als die Anderen zu. Spieler z muss 20 Liegestütze machen. Schafft Spieler z die Challenge nicht muss Spieler Y 10 Liegestütze schaffen. Danach wäre Spieler Z mit 5 Liegestütze dran.";
  String spielZiel = "Das Ziel des Spieles ist es so viele mögliche Punkte zu sammeln und die Variante für sich zu entscheiden. Das Spiel ist vorbei, wenn die letzte Challenge absolviert ist. ";
  String besonderheiten = "Die Challenges sind aus vielen unterschiedlichen Bereichen wie Geschicklichkeit, Sport, Glück, Abstraktion, Wissen, Strategie, Logik... Es gibt also keine Ausreden.";

  Widget getDropdownText(String value) {
    if (value == "Spielvorbereitung") {
      return Text(
          spielvorbereitung, style: TextStyle(fontSize: 20),);
    } else if(value == "Spielverlauf") {
      return Text(spielverlauf, style: TextStyle(fontSize: 20),);
    } else if(value == "Spielbeispiel") {
      return Text(spielBeispiel, style: TextStyle(fontSize: 20),);
    } else if(value == "Spielziel") {
      return Text(spielZiel, style: TextStyle(fontSize: 20),);
    } else if(value == "Besonderheiten") {
      return Text(besonderheiten, style: TextStyle(fontSize: 20),);
    }
    else return Text("Fehler");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Spielregeln',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: DropdownButton<String>(
              focusColor: Colors.white,
              value: _chosenValue,
              //elevation: 5,
              style: TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: <String>[
                'Spielvorbereitung',
                'Spielverlauf',
                'Spielbeispiel',
                'Spielziel',
                'Besonderheiten'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                );
              }).toList(),
              hint: Text(
                "Please choose a langauage",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              onChanged: (String? value) {
                setState(() {
                  _chosenValue = value!;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child:  getDropdownText(_chosenValue),
          )
        ],
      ),
    );
  }
}
