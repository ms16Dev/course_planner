// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseInfo _$CourseInfoFromJson(Map<String, dynamic> json) {
  return _CourseInfo.fromJson(json);
}

/// @nodoc
mixin _$CourseInfo {
  /// [Field] name
  String? get field => throw _privateConstructorUsedError;

  /// Start date (check in) of course
  DateTime? get startDate => throw _privateConstructorUsedError;

  /// End date (check out) of course
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// Number of students
  int? get students => throw _privateConstructorUsedError;

  /// Selected [Subject] reference
  String? get subject => throw _privateConstructorUsedError;

  /// Selected [Summary] references
  List<String> get summaries => throw _privateConstructorUsedError;

  /// Serializes this CourseInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseInfoCopyWith<CourseInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseInfoCopyWith<$Res> {
  factory $CourseInfoCopyWith(
          CourseInfo value, $Res Function(CourseInfo) then) =
      _$CourseInfoCopyWithImpl<$Res, CourseInfo>;
  @useResult
  $Res call(
      {String? field,
      DateTime? startDate,
      DateTime? endDate,
      int? students,
      String? subject,
      List<String> summaries});
}

/// @nodoc
class _$CourseInfoCopyWithImpl<$Res, $Val extends CourseInfo>
    implements $CourseInfoCopyWith<$Res> {
  _$CourseInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? students = freezed,
    Object? subject = freezed,
    Object? summaries = null,
  }) {
    return _then(_value.copyWith(
      field: freezed == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      students: freezed == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as int?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      summaries: null == summaries
          ? _value.summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseInfoImplCopyWith<$Res>
    implements $CourseInfoCopyWith<$Res> {
  factory _$$CourseInfoImplCopyWith(
          _$CourseInfoImpl value, $Res Function(_$CourseInfoImpl) then) =
      __$$CourseInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? field,
      DateTime? startDate,
      DateTime? endDate,
      int? students,
      String? subject,
      List<String> summaries});
}

/// @nodoc
class __$$CourseInfoImplCopyWithImpl<$Res>
    extends _$CourseInfoCopyWithImpl<$Res, _$CourseInfoImpl>
    implements _$$CourseInfoImplCopyWith<$Res> {
  __$$CourseInfoImplCopyWithImpl(
      _$CourseInfoImpl _value, $Res Function(_$CourseInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? students = freezed,
    Object? subject = freezed,
    Object? summaries = null,
  }) {
    return _then(_$CourseInfoImpl(
      field: freezed == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      students: freezed == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as int?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      summaries: null == summaries
          ? _value._summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseInfoImpl implements _CourseInfo {
  const _$CourseInfoImpl(
      {this.field,
      this.startDate,
      this.endDate,
      this.students,
      this.subject,
      final List<String> summaries = const []})
      : _summaries = summaries;

  factory _$CourseInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseInfoImplFromJson(json);

  /// [Field] name
  @override
  final String? field;

  /// Start date (check in) of course
  @override
  final DateTime? startDate;

  /// End date (check out) of course
  @override
  final DateTime? endDate;

  /// Number of students
  @override
  final int? students;

  /// Selected [Subject] reference
  @override
  final String? subject;

  /// Selected [Summary] references
  final List<String> _summaries;

  /// Selected [Summary] references
  @override
  @JsonKey()
  List<String> get summaries {
    if (_summaries is EqualUnmodifiableListView) return _summaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_summaries);
  }

  @override
  String toString() {
    return 'CourseInfo(field: $field, startDate: $startDate, endDate: $endDate, students: $students, subject: $subject, summaries: $summaries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseInfoImpl &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.students, students) ||
                other.students == students) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            const DeepCollectionEquality()
                .equals(other._summaries, _summaries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, field, startDate, endDate,
      students, subject, const DeepCollectionEquality().hash(_summaries));

  /// Create a copy of CourseInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseInfoImplCopyWith<_$CourseInfoImpl> get copyWith =>
      __$$CourseInfoImplCopyWithImpl<_$CourseInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseInfoImplToJson(
      this,
    );
  }
}

abstract class _CourseInfo implements CourseInfo {
  const factory _CourseInfo(
      {final String? field,
      final DateTime? startDate,
      final DateTime? endDate,
      final int? students,
      final String? subject,
      final List<String> summaries}) = _$CourseInfoImpl;

  factory _CourseInfo.fromJson(Map<String, dynamic> json) =
      _$CourseInfoImpl.fromJson;

  /// [Field] name
  @override
  String? get field;

  /// Start date (check in) of course
  @override
  DateTime? get startDate;

  /// End date (check out) of course
  @override
  DateTime? get endDate;

  /// Number of students
  @override
  int? get students;

  /// Selected [Subject] reference
  @override
  String? get subject;

  /// Selected [Summary] references
  @override
  List<String> get summaries;

  /// Create a copy of CourseInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseInfoImplCopyWith<_$CourseInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
