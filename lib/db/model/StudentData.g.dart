// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StudentData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentDataAdapter extends TypeAdapter<StudentData> {
  @override
  final int typeId = 1;

  @override
  StudentData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentData(
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      age: fields[3] as String,
      profession: fields[4] as String,
      image: fields[5] as String?,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, StudentData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.profession)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
