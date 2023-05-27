import 'package:hive/hive.dart';

part 'variante.g.dart';

@HiveType(typeId: 1)
class Variante {
  @HiveField(0)
  late final int id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String description;
  @HiveField(3)
  late bool active;

  Variante(
      {required this.id,
      required this.name,
      required this.description,
      required this.active});
}
