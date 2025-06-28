// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'format.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FormatAdapter extends TypeAdapter<Format> {
  @override
  final int typeId = 2;

  @override
  Format read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Format(
      textHtml: fields[0] as String?,
      zip: fields[1] as String?,
      ebook: fields[2] as String?,
      textPlain: fields[3] as String?,
      image: fields[4] as String?,
      stream: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Format obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.textHtml)
      ..writeByte(1)
      ..write(obj.zip)
      ..writeByte(2)
      ..write(obj.ebook)
      ..writeByte(3)
      ..write(obj.textPlain)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.stream);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
