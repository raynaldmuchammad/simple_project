class Person {
  late String? name;
  late int? birthYear;
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
}
