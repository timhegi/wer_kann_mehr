// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variante.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VarianteAdapter extends TypeAdapter<Variante> {
  @override
  final int typeId = 1;

  @override
  Variante read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Variante(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String,
      active: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Variante obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.active);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VarianteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
