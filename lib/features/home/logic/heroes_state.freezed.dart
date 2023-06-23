// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heroes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HeroesState {
  HeroesStatus get status => throw _privateConstructorUsedError;
  int get itemsLoading => throw _privateConstructorUsedError;
  List<Character> get heroes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HeroesStateCopyWith<HeroesState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeroesStateCopyWith<$Res> {
  factory $HeroesStateCopyWith(HeroesState value, $Res Function(HeroesState) then) =
      _$HeroesStateCopyWithImpl<$Res, HeroesState>;
  @useResult
  $Res call({HeroesStatus status, int itemsLoading, List<Character> heroes});
}

/// @nodoc
class _$HeroesStateCopyWithImpl<$Res, $Val extends HeroesState> implements $HeroesStateCopyWith<$Res> {
  _$HeroesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? itemsLoading = null,
    Object? heroes = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HeroesStatus,
      itemsLoading: null == itemsLoading
          ? _value.itemsLoading
          : itemsLoading // ignore: cast_nullable_to_non_nullable
              as int,
      heroes: null == heroes
          ? _value.heroes
          : heroes // ignore: cast_nullable_to_non_nullable
              as List<Character>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HeroesStateDataClassCopyWith<$Res> implements $HeroesStateCopyWith<$Res> {
  factory _$$_HeroesStateDataClassCopyWith(_$_HeroesStateDataClass value, $Res Function(_$_HeroesStateDataClass) then) =
      __$$_HeroesStateDataClassCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HeroesStatus status, int itemsLoading, List<Character> heroes});
}

/// @nodoc
class __$$_HeroesStateDataClassCopyWithImpl<$Res> extends _$HeroesStateCopyWithImpl<$Res, _$_HeroesStateDataClass>
    implements _$$_HeroesStateDataClassCopyWith<$Res> {
  __$$_HeroesStateDataClassCopyWithImpl(_$_HeroesStateDataClass _value, $Res Function(_$_HeroesStateDataClass) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? itemsLoading = null,
    Object? heroes = null,
  }) {
    return _then(_$_HeroesStateDataClass(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HeroesStatus,
      itemsLoading: null == itemsLoading
          ? _value.itemsLoading
          : itemsLoading // ignore: cast_nullable_to_non_nullable
              as int,
      heroes: null == heroes
          ? _value._heroes
          : heroes // ignore: cast_nullable_to_non_nullable
              as List<Character>,
    ));
  }
}

/// @nodoc

class _$_HeroesStateDataClass implements _HeroesStateDataClass {
  const _$_HeroesStateDataClass(
      {required this.status, required this.itemsLoading, required final List<Character> heroes})
      : _heroes = heroes;

  @override
  final HeroesStatus status;
  @override
  final int itemsLoading;
  final List<Character> _heroes;
  @override
  List<Character> get heroes {
    if (_heroes is EqualUnmodifiableListView) return _heroes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_heroes);
  }

  @override
  String toString() {
    return 'HeroesState(status: $status, itemsLoading: $itemsLoading, heroes: $heroes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HeroesStateDataClass &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.itemsLoading, itemsLoading) || other.itemsLoading == itemsLoading) &&
            const DeepCollectionEquality().equals(other._heroes, _heroes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, itemsLoading, const DeepCollectionEquality().hash(_heroes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HeroesStateDataClassCopyWith<_$_HeroesStateDataClass> get copyWith =>
      __$$_HeroesStateDataClassCopyWithImpl<_$_HeroesStateDataClass>(this, _$identity);
}

abstract class _HeroesStateDataClass implements HeroesState {
  const factory _HeroesStateDataClass(
      {required final HeroesStatus status,
      required final int itemsLoading,
      required final List<Character> heroes}) = _$_HeroesStateDataClass;

  @override
  HeroesStatus get status;
  @override
  int get itemsLoading;
  @override
  List<Character> get heroes;
  @override
  @JsonKey(ignore: true)
  _$$_HeroesStateDataClassCopyWith<_$_HeroesStateDataClass> get copyWith => throw _privateConstructorUsedError;
}
