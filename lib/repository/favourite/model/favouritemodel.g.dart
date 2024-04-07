// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favouritemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteAdapter extends TypeAdapter<Favourite> {
  @override
  final int typeId = 1;

  @override
  Favourite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Favourite(
      author: fields[0] as String,
      title: fields[1] as String,
      urlToImage: fields[2] as String,
      content: fields[4] as String?,
      description: fields[3] as String?,
      publishedAt: fields[6] as DateTime,
      url: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Favourite obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.author)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.urlToImage)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.content)
      ..writeByte(5)
      ..write(obj.url)
      ..writeByte(6)
      ..write(obj.publishedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
