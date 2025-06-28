class Format {
  late String? textHtml;
  late String? zip;
  late String? ebook;
  late String? textPlain;
  late String? image;
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
        image: data["image/jpeg"] ?? '',
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
