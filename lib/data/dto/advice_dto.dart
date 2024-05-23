import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'advice_dto.g.dart';

@JsonSerializable()
class AdviceDto with EquatableMixin {
  final String advice;
  @JsonKey(name: 'advice_id')
  final int id;

  AdviceDto({required this.advice, required this.id});

  @override
  List<Object?> get props => [advice, id];

  factory AdviceDto.fromJson(Map<String, dynamic> json) => _$AdviceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AdviceDtoToJson(this);
}
