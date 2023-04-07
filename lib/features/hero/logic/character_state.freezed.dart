// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CharacterState {
  Character get character => throw _privateConstructorUsedError;
  CharacterStateStatus get status => throw _privateConstructorUsedError;
  List<Comic>? get comics => throw _privateConstructorUsedError;
  List<Event>? get events => throw _privateConstructorUsedError;
  List<Serie>? get series => throw _privateConstructorUsedError;
  List<Story>? get stories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CharacterStateCopyWith<CharacterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterStateCopyWith<$Res> {
  factory $CharacterStateCopyWith(
          CharacterState value, $Res Function(CharacterState) then) =
      _$CharacterStateCopyWithImpl<$Res, CharacterState>;
  @useResult
  $Res call(
      {Character character,
      CharacterStateStatus status,
      List<Comic>? comics,
      List<Event>? events,
      List<Serie>? series,
      List<Story>? stories});
}

/// @nodoc
class _$CharacterStateCopyWithImpl<$Res, $Val extends CharacterState>
    implements $CharacterStateCopyWith<$Res> {
  _$CharacterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
    Object? status = null,
    Object? comics = freezed,
    Object? events = freezed,
    Object? series = freezed,
    Object? stories = freezed,
  }) {
    return _then(_value.copyWith(
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CharacterStateStatus,
      comics: freezed == comics
          ? _value.comics
          : comics // ignore: cast_nullable_to_non_nullable
              as List<Comic>?,
      events: freezed == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as List<Serie>?,
      stories: freezed == stories
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<Story>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CharacterStateDataClassCopyWith<$Res>
    implements $CharacterStateCopyWith<$Res> {
  factory _$$_CharacterStateDataClassCopyWith(_$_CharacterStateDataClass value,
          $Res Function(_$_CharacterStateDataClass) then) =
      __$$_CharacterStateDataClassCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Character character,
      CharacterStateStatus status,
      List<Comic>? comics,
      List<Event>? events,
      List<Serie>? series,
      List<Story>? stories});
}

/// @nodoc
class __$$_CharacterStateDataClassCopyWithImpl<$Res>
    extends _$CharacterStateCopyWithImpl<$Res, _$_CharacterStateDataClass>
    implements _$$_CharacterStateDataClassCopyWith<$Res> {
  __$$_CharacterStateDataClassCopyWithImpl(_$_CharacterStateDataClass _value,
      $Res Function(_$_CharacterStateDataClass) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
    Object? status = null,
    Object? comics = freezed,
    Object? events = freezed,
    Object? series = freezed,
    Object? stories = freezed,
  }) {
    return _then(_$_CharacterStateDataClass(
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CharacterStateStatus,
      comics: freezed == comics
          ? _value._comics
          : comics // ignore: cast_nullable_to_non_nullable
              as List<Comic>?,
      events: freezed == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
      series: freezed == series
          ? _value._series
          : series // ignore: cast_nullable_to_non_nullable
              as List<Serie>?,
      stories: freezed == stories
          ? _value._stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<Story>?,
    ));
  }
}

/// @nodoc

class _$_CharacterStateDataClass implements _CharacterStateDataClass {
  const _$_CharacterStateDataClass(
      {required this.character,
      required this.status,
      final List<Comic>? comics,
      final List<Event>? events,
      final List<Serie>? series,
      final List<Story>? stories})
      : _comics = comics,
        _events = events,
        _series = series,
        _stories = stories;

  @override
  final Character character;
  @override
  final CharacterStateStatus status;
  final List<Comic>? _comics;
  @override
  List<Comic>? get comics {
    final value = _comics;
    if (value == null) return null;
    if (_comics is EqualUnmodifiableListView) return _comics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Event>? _events;
  @override
  List<Event>? get events {
    final value = _events;
    if (value == null) return null;
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Serie>? _series;
  @override
  List<Serie>? get series {
    final value = _series;
    if (value == null) return null;
    if (_series is EqualUnmodifiableListView) return _series;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Story>? _stories;
  @override
  List<Story>? get stories {
    final value = _stories;
    if (value == null) return null;
    if (_stories is EqualUnmodifiableListView) return _stories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CharacterState(character: $character, status: $status, comics: $comics, events: $events, series: $series, stories: $stories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterStateDataClass &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._comics, _comics) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            const DeepCollectionEquality().equals(other._series, _series) &&
            const DeepCollectionEquality().equals(other._stories, _stories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      character,
      status,
      const DeepCollectionEquality().hash(_comics),
      const DeepCollectionEquality().hash(_events),
      const DeepCollectionEquality().hash(_series),
      const DeepCollectionEquality().hash(_stories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterStateDataClassCopyWith<_$_CharacterStateDataClass>
      get copyWith =>
          __$$_CharacterStateDataClassCopyWithImpl<_$_CharacterStateDataClass>(
              this, _$identity);
}

abstract class _CharacterStateDataClass implements CharacterState {
  const factory _CharacterStateDataClass(
      {required final Character character,
      required final CharacterStateStatus status,
      final List<Comic>? comics,
      final List<Event>? events,
      final List<Serie>? series,
      final List<Story>? stories}) = _$_CharacterStateDataClass;

  @override
  Character get character;
  @override
  CharacterStateStatus get status;
  @override
  List<Comic>? get comics;
  @override
  List<Event>? get events;
  @override
  List<Serie>? get series;
  @override
  List<Story>? get stories;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterStateDataClassCopyWith<_$_CharacterStateDataClass>
      get copyWith => throw _privateConstructorUsedError;
}
