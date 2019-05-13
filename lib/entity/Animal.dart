import 'package:json_annotation/json_annotation.dart';
part 'Animal.g.dart';
@JsonSerializable()
class Animal extends Object{
  String sex;
  String name;
  Animal(this.sex,this.name);

  factory Animal.fromJson(Map<String,dynamic> j) => _$AnimalFromJson(j);
  Map<String, dynamic> toJson() => _$AnimalToJson(this);
}