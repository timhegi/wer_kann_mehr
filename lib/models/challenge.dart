import 'package:hive/hive.dart';

part 'challenge.g.dart';

@HiveType(typeId: 0)
class Challenge {
  @HiveField(0)
  late final int id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String description;
  @HiveField(3)
  late String variante;
  @HiveField(4)
  late bool active;
  @HiveField(5)
  late bool played;

  Challenge(
      {required this.id,
      required this.name,
      required this.description,
      required this.variante,
      required this.active,
      required this.played});
}
