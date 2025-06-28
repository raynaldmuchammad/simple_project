import 'package:simple_project/component/data/models/format.dart';
import 'package:simple_project/component/data/models/person.dart';
import 'package:hive/hive.dart';

part 'book.g.dart';

@HiveType(typeId: 0)
class Book {
  @HiveField(0)
  late int? id;

  @HiveField(1)
  late String? title;

  @HiveField(2)
  late List<String>? subjects;

  @HiveField(3)
  late List<Person>? authors;

  @HiveField(4)
  late List<String>? summaries;

  @HiveField(5)
  late List<Person>? translators;

  @HiveField(6)
  late List<String>? bookshelves;

  @HiveField(7)
  late List<String>? languages;

  @HiveField(8)
  late bool? copyright;

  @HiveField(9)
  late String? mediaType;

  @HiveField(10)
  late Format? formats;

  @HiveField(11)
  late int? downloadCount;

  Book({
    this.id,
    this.title,
    this.subjects,
    this.authors,
    this.summaries,
    this.translators,
    this.bookshelves,
    this.languages,
    this.copyright,
    this.mediaType,
    this.formats,
    this.downloadCount,
  });

  factory Book.fromJson(Map<String, dynamic> data) => Book(
        id: data["id"] ?? 0,
        title: data["title"] ?? '',
        subjects: data["subjects"] != null
            ? List<String>.from(data['subjects'].map((data) => data)).toList()
            : [],
        authors: data["authors"] != null
            ? List<Person>.from(
                data["authors"].map((author) => Person.fromJson(author)),
              ).toList()
            : [],
        summaries: data["summaries"] != null
            ? List<String>.from(data['summaries'].map((data) => data)).toList()
            : [],
        translators: data["translators"] != null
            ? List<Person>.from(
                data["translators"]
                    .map((translator) => Person.fromJson(translator)),
              ).toList()
            : [],
        bookshelves: data["bookshelves"] != null
            ? List<String>.from(
                data['bookshelves'].map((data) => data),
              ).toList()
            : [],
        languages: data["languages"] != null
            ? List<String>.from(
                data['languages'].map((data) => data),
              ).toList()
            : [],
        copyright: data["copyright"] ?? '',
        mediaType: data["media_type"] ?? '',
        formats: Format.fromJson(data["formats"]),
        downloadCount: data["download_count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subjects": subjects != null
            ? subjects!.map((subject) => subject).toList()
            : null,
        "authors": authors != null
            ? authors!.map((author) => author.toJson()).toList()
            : null,
        "summaries": summaries != null
            ? summaries!.map((summaries) => summaries).toList()
            : null,
        "translators": translators != null
            ? translators!.map((translator) => translator.toJson()).toList()
            : null,
        "bookshelves": bookshelves != null
            ? bookshelves!.map((bookshelves) => bookshelves).toList()
            : null,
        "languages": languages != null
            ? languages!.map((language) => language).toList()
            : null,
        "copyright": copyright,
        "media_type": mediaType,
        "formats": formats!.toJson(),
        "download_count": downloadCount,
      };
}
