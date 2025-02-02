// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseInfoImpl _$$CourseInfoImplFromJson(Map<String, dynamic> json) =>
    _$CourseInfoImpl(
      field: json['field'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      students: (json['students'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      summaries: (json['summaries'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CourseInfoImplToJson(_$CourseInfoImpl instance) =>
    <String, dynamic>{
      'field': instance.field,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'students': instance.students,
      'subject': instance.subject,
      'summaries': instance.summaries,
    };
