// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moneyFlow.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoneyFlowAdapter extends TypeAdapter<MoneyFlow> {
  @override
  final int typeId = 1;

  @override
  MoneyFlow read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoneyFlow(
      fields[1] as String,
      fields[2] as double,
      fields[3] as DateTime,
      fields[4] as String,
      fields[5] as bool,
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MoneyFlow obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title_flow)
      ..writeByte(2)
      ..write(obj.value)
      ..writeByte(3)
      ..write(obj.dateTime)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.entrance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoneyFlowAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
