// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayValues _$DayValuesFromJson(Map<String, dynamic> json) {
  return DayValues(
    day: json['day'] as String,
    waterIntake: json['waterIntake'] as int,
    carbsIntake: json['carbsIntake'] as int,
    waterIntakeLastWeek: json['waterIntakeLastWeek'] as List<ChartValue>,
    carbsIntakeLastWeek: json['carbsIntakeLastWeek'] as List<ChartValue>,
  );
}

Map<String, dynamic> _$DayValuesToJson(DayValues instance) => <String, dynamic>{
      'day': instance.day,
      'waterIntake': instance.waterIntake,
      'carbsIntake': instance.carbsIntake,
      'waterIntakeLastWeek': instance.waterIntakeLastWeek,
      'carbsIntakeLastWeek': instance.carbsIntakeLastWeek,
    };
