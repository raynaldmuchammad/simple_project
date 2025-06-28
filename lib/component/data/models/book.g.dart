// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookAdapter extends TypeAdapter<Book> {
  @override
  final int typeId = 0;

  @override
  Book read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Book(
      id: fields[0] as int?,
      title: fields[1] as String?,
      subjects: (fields[2] as List?)?.cast<String>(),
      authors: (fields[3] as List?)?.cast<Person>(),
      summaries: (fields[4] as List?)?.cast<String>(),
      translators: (fields[5] as List?)?.cast<Person>(),
      bookshelves: (fields[6] as List?)?.cast<String>(),
      languages: (fields[7] as List?)?.cast<String>(),
      copyright: fields[8] as bool?,
      mediaType: fields[9] as String?,
      formats: fields[10] as Format?,
      downloadCount: fields[11] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Book obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.subjects)
      ..writeByte(3)
      ..write(obj.authors)
      ..writeByte(4)
      ..write(obj.summaries)
      ..writeByte(5)
      ..write(obj.translators)
      ..writeByte(6)
      ..write(obj.bookshelves)
      ..writeByte(7)
      ..write(obj.languages)
      ..writeByte(8)
      ..write(obj.copyright)
      ..writeByte(9)
      ..write(obj.mediaType)
      ..writeByte(10)
      ..write(obj.formats)
      ..writeByte(11)
      ..write(obj.downloadCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
