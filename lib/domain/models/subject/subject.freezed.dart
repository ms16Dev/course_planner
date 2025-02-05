// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return _Subject.fromJson(json);
}

/// @nodoc
mixin _$Subject {
  /// e.g. 'math102'
  String get ref => throw _privateConstructorUsedError;

  /// e.g. 'Mathematics 102'
  String get name => throw _privateConstructorUsedError;

  /// e.g. 'Computer Science'
  String get field => throw _privateConstructorUsedError;

  /// e.g. 'Basic CS mathematics  ...'
  String get description => throw _privateConstructorUsedError;

  /// e.g. ['Algebra', 'Matrices', 'Numerical Analysis']
  List<String> get tags => throw _privateConstructorUsedError;

  /// e.g. 'https://storage.googleapis.com/tripedia-images/subjects/alaska.jpg'
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this Subject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectCopyWith<Subject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectCopyWith<$Res> {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) then) =
      _$SubjectCopyWithImpl<$Res, Subject>;
  @useResult
  $Res call(
      {String ref,
      String name,
      String field,
      String description,
      List<String> tags,
      String imageUrl});
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res, $Val extends Subject>
    implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? name = null,
    Object? field = null,
    Object? description = null,
    Object? tags = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectImplCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$$SubjectImplCopyWith(
          _$SubjectImpl value, $Res Function(_$SubjectImpl) then) =
      __$$SubjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ref,
      String name,
      String field,
      String description,
      List<String> tags,
      String imageUrl});
}

/// @nodoc
class __$$SubjectImplCopyWithImpl<$Res>
    extends _$SubjectCopyWithImpl<$Res, _$SubjectImpl>
    implements _$$SubjectImplCopyWith<$Res> {
  __$$SubjectImplCopyWithImpl(
      _$SubjectImpl _value, $Res Function(_$SubjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? name = null,
    Object? field = null,
    Object? description = null,
    Object? tags = null,
    Object? imageUrl = null,
  }) {
    return _then(_$SubjectImpl(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectImpl implements _Subject {
  const _$SubjectImpl(
      {required this.ref,
      required this.name,
      required this.field,
      required this.description,
      required final List<String> tags,
      required this.imageUrl})
      : _tags = tags;

  factory _$SubjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectImplFromJson(json);

  /// e.g. 'math102'
  @override
  final String ref;

  /// e.g. 'Mathematics 102'
  @override
  final String name;

  /// e.g. 'Computer Science'
  @override
  final String field;

  /// e.g. 'Basic CS mathematics  ...'
  @override
  final String description;

  /// e.g. ['Algebra', 'Matrices', 'Numerical Analysis']
  final List<String> _tags;

  /// e.g. ['Algebra', 'Matrices', 'Numerical Analysis']
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  /// e.g. 'https://storage.googleapis.com/tripedia-images/subjects/alaska.jpg'
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'Subject(ref: $ref, name: $name, field: $field, description: $description, tags: $tags, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectImpl &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ref, name, field, description,
      const DeepCollectionEquality().hash(_tags), imageUrl);

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      __$$SubjectImplCopyWithImpl<_$SubjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectImplToJson(
      this,
    );
  }
}

abstract class _Subject implements Subject {
  const factory _Subject(
      {required final String ref,
      required final String name,
      required final String field,
      required final String description,
      required final List<String> tags,
      required final String imageUrl}) = _$SubjectImpl;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$SubjectImpl.fromJson;

  /// e.g. 'math102'
  @override
  String get ref;

  /// e.g. 'Mathematics 102'
  @override
  String get name;

  /// e.g. 'Computer Science'
  @override
  String get field;

  /// e.g. 'Basic CS mathematics  ...'
  @override
  String get description;

  /// e.g. ['Algebra', 'Matrices', 'Numerical Analysis']
  @override
  List<String> get tags;

  /// e.g. 'https://storage.googleapis.com/tripedia-images/subjects/alaska.jpg'
  @override
  String get imageUrl;

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
