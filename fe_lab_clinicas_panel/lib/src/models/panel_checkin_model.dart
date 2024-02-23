// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'panel_checkin_model.g.dart';

@JsonSerializable()
class PanelCheckinModel {
  PanelCheckinModel({
    required this.id,
    required this.password,
    required this.attendantDesk,
  });

  final String id;
  final String password;
  @JsonKey(name: 'attendant_desk')
  final int attendantDesk;

  factory PanelCheckinModel.fromJson(Map<String, dynamic> json) =>
      _$PanelCheckinModelFromJson(json);

  Map<String, dynamic> toJson() => _$PanelCheckinModelToJson(this);
}
