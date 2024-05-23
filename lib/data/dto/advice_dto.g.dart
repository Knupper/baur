// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advice_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdviceDto _$AdviceDtoFromJson(Map<String, dynamic> json) => AdviceDto(
      advice: json['advice'] as String,
      id: (json['advice_id'] as num).toInt(),
    );

Map<String, dynamic> _$AdviceDtoToJson(AdviceDto instance) => <String, dynamic>{
      'advice': instance.advice,
      'advice_id': instance.id,
    };
