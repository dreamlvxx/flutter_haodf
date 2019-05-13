// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return Patient(
      json['name'] as String,
      json['id'] as String,
      json['phone'] as String,
      json['animal'] == null
          ? null
          : Animal.fromJson(json['animal'] as Map<String, dynamic>),
      json['tiger'] == null
          ? null
          : Tiger.fromJson(json['tiger'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'animal': instance.animal,
      'tiger': instance.tiger,
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone
    };

Tiger _$TigerFromJson(Map<String, dynamic> json) {
  return Tiger(json['sss'] as String, json['yyy'] as String);
}

Map<String, dynamic> _$TigerToJson(Tiger instance) =>
    <String, dynamic>{'sss': instance.sss, 'yyy': instance.yyy};
