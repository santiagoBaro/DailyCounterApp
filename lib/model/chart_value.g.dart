// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChartValue _$ChartValueFromJson(Map<String, dynamic> json) {
  return ChartValue(
    date: json['date'] as String,
    ammount: json['ammount'] as int,
  );
}

Map<String, dynamic> _$ChartValueToJson(ChartValue instance) =>
    <String, dynamic>{
      'date': instance.date,
      'ammount': instance.ammount,
    };
