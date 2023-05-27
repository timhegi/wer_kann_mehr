import 'package:hive/hive.dart';
import 'package:wer_kann_mehr/models/variante.dart';
import 'package:wer_kann_mehr/models/variantenObjekt.dart';

class VariantenService {
  List<VariantenObjekt> createVariantenList() {
    List<VariantenObjekt> variantenList = [];

    VariantenObjekt bar = VariantenObjekt(
        0,
        "bar",
        "Beschreibung: Für diese Variante benötigst Du nur Zettel und Stifte",
        false);

    VariantenObjekt zuhause = VariantenObjekt(
        1,
        "zuhause",
        "Beschreibung: Für diese Variante benötigst Du Dinge aus dem Haushalt. Wenn Du diese Dinge nicht zuhause hast kannst Du einfach weiter zur nächsten Challenge",
        false);

    VariantenObjekt ue18 = VariantenObjekt(2, "ü18",
        "Beschreibung: Für diese Variante brauchst Du Alkohol", false);

    variantenList.add(bar);
    variantenList.add(zuhause);
    variantenList.add(ue18);

    return variantenList;
  }

  fillHiveBox() async {
    Box challengeBox = await Hive.box<Variante>("variantenBox");
    List<VariantenObjekt> challengeList = createVariantenList();

    for (var element in challengeList) {
      await challengeBox.put(
          element.id,
          Variante(
              id: element.id,
              name: element.title,
              description: element.description,
              active: element.active));
    }
  }

  filterActiveVariante() {
    Box variantenBox = Hive.box<Variante>("variantenBox");

    Variante variante =
        variantenBox.values.where((element) => element.active == true).first;

    return variante;
  }

  setVarianteActive(String name) {
    Variante variante = Hive.box<Variante>("variantenBox")
        .values
        .where((element) => element.name.toString() == name.toString())
        .first;

    variante.active = true;

    Hive.box<Variante>("variantenBox").put(variante.id, variante);
  }

  deleteActiveVariante() {
    Variante variante = Hive.box<Variante>("variantenBox")
        .values
        .where((element) => element.active == true)
        .first;

    variante.active = false;

    Hive.box<Variante>("variantenBox").put(variante.id, variante);
  }
}
