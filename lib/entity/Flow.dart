import 'package:json_annotation/json_annotation.dart';
part 'Flow.g.dart';
@JsonSerializable()
class Flow{
  var patient;
  var doctor;

  Flow(this.patient, this.doctor);

  factory Flow.fromJson(Map<String,dynamic> json) => _$FlowFromJson(json);
  Map<String,dynamic> toJson() => _$FlowToJson(this);

  Flow.empty();
}