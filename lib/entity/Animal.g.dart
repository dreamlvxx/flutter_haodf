// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animal _$AnimalFromJson(Map<String, dynamic> json) {
  return Animal(json['sex'] as String, json['name'] as String);
}

Map<String, dynamic> _$AnimalToJson(Animal instance) =>
    <String, dynamic>{'sex': instance.sex, 'name': instance.name};
