import 'package:json_annotation/json_annotation.dart';
part 'Doctor.g.dart';
@JsonSerializable()
class Doctor extends Object{
  var name;
  var sex;

  Doctor(this.name, this.sex);

  factory Doctor.fromJson(Map<String,dynamic> json) => _$DoctorFromJson(json);
  Map<String,dynamic> toJson() => _$DoctorToJson(this);

}