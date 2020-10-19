// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClienteEntityAdapter extends TypeAdapter<ClienteEntity> {
  @override
  final int typeId = 0;

  @override
  ClienteEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClienteEntity(
      id: fields[0] as String,
      nome: fields[1] as String,
      telefone: fields[2] as String,
      email: fields[3] as String,
      endereco: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ClienteEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nome)
      ..writeByte(2)
      ..write(obj.telefone)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.endereco);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClienteEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
