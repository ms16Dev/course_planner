// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubjectImpl _$$SubjectImplFromJson(Map<String, dynamic> json) =>
    _$SubjectImpl(
      ref: json['ref'] as String,
      name: json['name'] as String,
      field: json['field'] as String,
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$SubjectImplToJson(_$SubjectImpl instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'name': instance.name,
      'field': instance.field,
      'description': instance.description,
      'tags': instance.tags,
      'imageUrl': instance.imageUrl,
    };
