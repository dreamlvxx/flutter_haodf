import 'package:json_annotation/json_annotation.dart';

part 'Drug.g.dart';
@JsonSerializable()
class Drug extends Object{
  String name;
  String price;

  Drug(this.name, this.price);

  factory Drug.fromJson(Map<String,dynamic> json) => _$DrugFromJson(json);
  Map<String,dynamic> toJson() => _$DrugToJson(this);

}