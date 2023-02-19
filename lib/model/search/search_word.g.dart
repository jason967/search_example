// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_word.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchWordAdapter extends TypeAdapter<SearchWord> {
  @override
  final int typeId = 0;

  @override
  SearchWord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchWord(
      fields[0] as String,
      fields[1] == null ? '' : fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SearchWord obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchWordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
