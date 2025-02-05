// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return _Summary.fromJson(json);
}

/// @nodoc
mixin _$Summary {
  /// e.g. 'Basics of Computer Science'
  String get title => throw _privateConstructorUsedError;

  /// e.g. 'Embark on a thrilling adventure exploring the awe-inspiring glaciers of Alaska. Hike across the icy terrain, marvel at the deep blue crevasses, and even try your hand at ice climbing for an unforgettable experience.'
  String get description => throw _privateConstructorUsedError;

  /// Duration in days.
  /// e.g. 8
  int get duration => throw _privateConstructorUsedError;

  /// e.g. 4
  int get credits => throw _privateConstructorUsedError;

  /// e.g. 'math102'
  String get subjectRef => throw _privateConstructorUsedError;

  /// e.g. 'basics-of-computer-science'
  String get ref => throw _privateConstructorUsedError;

  /// e.g. 'https://storage.googleapis.com/tripedia-images/activities/alaska_glacier-trekking-and-ice-climbing.jpg'
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this Summary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryCopyWith<Summary> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryCopyWith<$Res> {
  factory $SummaryCopyWith(Summary value, $Res Function(Summary) then) =
      _$SummaryCopyWithImpl<$Res, Summary>;
  @useResult
  $Res call(
      {String title,
      String description,
      int duration,
      int credits,
      String subjectRef,
      String ref,
      String imageUrl});
}

/// @nodoc
class _$SummaryCopyWithImpl<$Res, $Val extends Summary>
    implements $SummaryCopyWith<$Res> {
  _$SummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? duration = null,
    Object? credits = null,
    Object? subjectRef = null,
    Object? ref = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int,
      subjectRef: null == subjectRef
          ? _value.subjectRef
          : subjectRef // ignore: cast_nullable_to_non_nullable
              as String,
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummaryImplCopyWith<$Res> implements $SummaryCopyWith<$Res> {
  factory _$$SummaryImplCopyWith(
          _$SummaryImpl value, $Res Function(_$SummaryImpl) then) =
      __$$SummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      int duration,
      int credits,
      String subjectRef,
      String ref,
      String imageUrl});
}

/// @nodoc
class __$$SummaryImplCopyWithImpl<$Res>
    extends _$SummaryCopyWithImpl<$Res, _$SummaryImpl>
    implements _$$SummaryImplCopyWith<$Res> {
  __$$SummaryImplCopyWithImpl(
      _$SummaryImpl _value, $Res Function(_$SummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? duration = null,
    Object? credits = null,
    Object? subjectRef = null,
    Object? ref = null,
    Object? imageUrl = null,
  }) {
    return _then(_$SummaryImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int,
      subjectRef: null == subjectRef
          ? _value.subjectRef
          : subjectRef // ignore: cast_nullable_to_non_nullable
              as String,
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryImpl implements _Summary {
  const _$SummaryImpl(
      {required this.title,
      required this.description,
      required this.duration,
      required this.credits,
      required this.subjectRef,
      required this.ref,
      required this.imageUrl});

  factory _$SummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryImplFromJson(json);

  /// e.g. 'Basics of Computer Science'
  @override
  final String title;

  /// e.g. 'Embark on a thrilling adventure exploring the awe-inspiring glaciers of Alaska. Hike across the icy terrain, marvel at the deep blue crevasses, and even try your hand at ice climbing for an unforgettable experience.'
  @override
  final String description;

  /// Duration in days.
  /// e.g. 8
  @override
  final int duration;

  /// e.g. 4
  @override
  final int credits;

  /// e.g. 'math102'
  @override
  final String subjectRef;

  /// e.g. 'basics-of-computer-science'
  @override
  final String ref;

  /// e.g. 'https://storage.googleapis.com/tripedia-images/activities/alaska_glacier-trekking-and-ice-climbing.jpg'
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'Summary(title: $title, description: $description, duration: $duration, credits: $credits, subjectRef: $subjectRef, ref: $ref, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.credits, credits) || other.credits == credits) &&
            (identical(other.subjectRef, subjectRef) ||
                other.subjectRef == subjectRef) &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, duration,
      credits, subjectRef, ref, imageUrl);

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      __$$SummaryImplCopyWithImpl<_$SummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryImplToJson(
      this,
    );
  }
}

abstract class _Summary implements Summary {
  const factory _Summary(
      {required final String title,
      required final String description,
      required final int duration,
      required final int credits,
      required final String subjectRef,
      required final String ref,
      required final String imageUrl}) = _$SummaryImpl;

  factory _Summary.fromJson(Map<String, dynamic> json) = _$SummaryImpl.fromJson;

  /// e.g. 'Basics of Computer Science'
  @override
  String get title;

  /// e.g. 'Embark on a thrilling adventure exploring the awe-inspiring glaciers of Alaska. Hike across the icy terrain, marvel at the deep blue crevasses, and even try your hand at ice climbing for an unforgettable experience.'
  @override
  String get description;

  /// Duration in days.
  /// e.g. 8
  @override
  int get duration;

  /// e.g. 4
  @override
  int get credits;

  /// e.g. 'math102'
  @override
  String get subjectRef;

  /// e.g. 'basics-of-computer-science'
  @override
  String get ref;

  /// e.g. 'https://storage.googleapis.com/tripedia-images/activities/alaska_glacier-trekking-and-ice-climbing.jpg'
  @override
  String get imageUrl;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
