import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_lxxfirst/entity/Animal.dart';
part 'patient.g.dart';

@JsonSerializable()
class Patient extends Object{
  Patient(this.name,this.id,this.phone,this.animal,this.tiger);

  Animal animal;
  Tiger tiger;
  String id;
  String name;
  String phone;

  factory Patient.fromJson(Map<String,dynamic> json) => _$PatientFromJson(json);
  Map<String,dynamic> toJson() => _$PatientToJson(this);

}

@JsonSerializable()
class Tiger{
  Tiger(this.sss,this.yyy);
  String sss;
  String yyy;

  factory Tiger.fromJson(Map<String,dynamic> json) => _$TigerFromJson(json);
  Map<String,dynamic> toJson() => _$TigerToJson(this);
}