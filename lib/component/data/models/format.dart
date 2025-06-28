import 'package:hive/hive.dart';

part 'format.g.dart';

@HiveType(typeId: 2)
class Format {
  @HiveField(0)
  late String? textHtml;

  @HiveField(1)
  late String? zip;

  @HiveField(2)
  late String? ebook;

  @HiveField(3)
  late String? textPlain;

  @HiveField(4)
  late String? image;

  @HiveField(5)
  late String? stream;

  Format({
    this.textHtml,
    this.zip,
    this.ebook,
    this.textPlain,
    this.image,
    this.stream,
  });

  factory Format.fromJson(Map<String, dynamic> data) => Format(
        textHtml: data["text/html"] ?? '',
        zip: data["application/epub+zip"] ?? '',
        ebook: data["application/x-mobipocket-ebook"] ?? '',
        textPlain: data["text/plain; charset=us-ascii"] ?? '',
        image: data["image/jpeg"] ?? 'https://placehold.co/600x400',
        stream: data["application/octet-stream"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "text/html": textHtml,
        "application/epub+zip": zip,
        "application/x-mobipocket-ebook": ebook,
        "text/plain; charset=us-ascii": textPlain,
        "image/jpeg": image,
        "application/octet-stream": stream,
      };
}
