// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayValues _$DayValuesFromJson(Map<String, dynamic> json) {
  return DayValues(
    dailyWaterTarget: json['dailyWaterTarget'] as int,
    day: json['day'] as String,
    waterIntake: json['waterIntake'] as int,
    carbsIntake: json['carbsIntake'] as int,
    carbsIntakeLastWeek: (json['carbsIntakeLastWeek'] as List)
        ?.map((e) =>
            e == null ? null : ChartValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    waterIntakeLastWeek: (json['waterIntakeLastWeek'] as List)
        ?.map((e) =>
            e == null ? null : ChartValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DayValuesToJson(DayValues instance) => <String, dynamic>{
      'dailyWaterTarget': instance.dailyWaterTarget,
      'day': instance.day,
      'waterIntake': instance.waterIntake,
      'carbsIntake': instance.carbsIntake,
      'waterIntakeLastWeek': instance.waterIntakeLastWeek,
      'carbsIntakeLastWeek': instance.carbsIntakeLastWeek,
    };
