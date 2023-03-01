// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sof_users_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SofUserEntityAdapter extends TypeAdapter<SofUserEntity> {
  @override
  final int typeId = 1;

  @override
  SofUserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SofUserEntity(
      reputation: fields[1] as int?,
      userId: fields[0] as int?,
      location: fields[2] as String?,
      profileImage: fields[3] as String?,
      displayName: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SofUserEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.reputation)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.profileImage)
      ..writeByte(4)
      ..write(obj.displayName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SofUserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
