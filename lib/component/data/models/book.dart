import 'package:simple_project/component/data/models/format.dart';
import 'package:simple_project/component/data/models/person.dart';

class Book {
  late int? id;
  late String? title;
  late List<String>? subjects;
  late List<Person>? authors;
  late List<String>? summaries;
  late List<Person>? translators;
  late List<String>? bookshelves;
  late List<String>? languages;
  late bool? copyright;
  late String? mediaType;
  late Format? formats;
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
        "subjects": subjects,
        "authors": authors,
        "summaries": summaries,
        "translators": translators,
        "bookshelves": bookshelves,
        "languages": languages,
        "copyright": copyright,
        "media_type": mediaType,
        "formats": formats,
        "download_count": downloadCount,
      };
}
