// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summarry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummarryImpl _$$SummarryImplFromJson(Map<String, dynamic> json) =>
    _$SummarryImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      duration: (json['duration'] as num).toInt(),
      credits: (json['credits'] as num).toInt(),
      subjectRef: json['subjectRef'] as String,
      ref: json['ref'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$SummarryImplToJson(_$SummarryImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'duration': instance.duration,
      'credits': instance.credits,
      'subjectRef': instance.subjectRef,
      'ref': instance.ref,
      'imageUrl': instance.imageUrl,
    };
