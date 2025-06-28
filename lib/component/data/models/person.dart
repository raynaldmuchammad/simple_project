import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(0)
  late String? name;

  @HiveField(1)
  late int? birthYear;

  @HiveField(2)
  late int? deathYear;

  Person({
    required this.name,
    required this.birthYear,
    required this.deathYear,
  });

  factory Person.fromJson(Map<String, dynamic> data) => Person(
        name: data["name"] ?? "",
        birthYear: data["birthYear"] ?? 0,
        deathYear: data["deathYear"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "birthYear": birthYear,
        "deathYear": deathYear,
      };
}
