// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recently_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecentlySearchState {
  RecentlySearchStatus get status => throw _privateConstructorUsedError;
  List<SearchWord> get searchWords => throw _privateConstructorUsedError;
  bool get saveOn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecentlySearchStateCopyWith<RecentlySearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentlySearchStateCopyWith<$Res> {
  factory $RecentlySearchStateCopyWith(
          RecentlySearchState value, $Res Function(RecentlySearchState) then) =
      _$RecentlySearchStateCopyWithImpl<$Res, RecentlySearchState>;
  @useResult
  $Res call(
      {RecentlySearchStatus status, List<SearchWord> searchWords, bool saveOn});
}

/// @nodoc
class _$RecentlySearchStateCopyWithImpl<$Res, $Val extends RecentlySearchState>
    implements $RecentlySearchStateCopyWith<$Res> {
  _$RecentlySearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? searchWords = null,
    Object? saveOn = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RecentlySearchStatus,
      searchWords: null == searchWords
          ? _value.searchWords
          : searchWords // ignore: cast_nullable_to_non_nullable
              as List<SearchWord>,
      saveOn: null == saveOn
          ? _value.saveOn
          : saveOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecentlySearchStateCopyWith<$Res>
    implements $RecentlySearchStateCopyWith<$Res> {
  factory _$$_RecentlySearchStateCopyWith(_$_RecentlySearchState value,
          $Res Function(_$_RecentlySearchState) then) =
      __$$_RecentlySearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RecentlySearchStatus status, List<SearchWord> searchWords, bool saveOn});
}

/// @nodoc
class __$$_RecentlySearchStateCopyWithImpl<$Res>
    extends _$RecentlySearchStateCopyWithImpl<$Res, _$_RecentlySearchState>
    implements _$$_RecentlySearchStateCopyWith<$Res> {
  __$$_RecentlySearchStateCopyWithImpl(_$_RecentlySearchState _value,
      $Res Function(_$_RecentlySearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? searchWords = null,
    Object? saveOn = null,
  }) {
    return _then(_$_RecentlySearchState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RecentlySearchStatus,
      searchWords: null == searchWords
          ? _value._searchWords
          : searchWords // ignore: cast_nullable_to_non_nullable
              as List<SearchWord>,
      saveOn: null == saveOn
          ? _value.saveOn
          : saveOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RecentlySearchState implements _RecentlySearchState {
  _$_RecentlySearchState(
      {this.status = RecentlySearchStatus.initial,
      final List<SearchWord> searchWords = const <SearchWord>[],
      this.saveOn = false})
      : _searchWords = searchWords;

  @override
  @JsonKey()
  final RecentlySearchStatus status;
  final List<SearchWord> _searchWords;
  @override
  @JsonKey()
  List<SearchWord> get searchWords {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchWords);
  }

  @override
  @JsonKey()
  final bool saveOn;

  @override
  String toString() {
    return 'RecentlySearchState(status: $status, searchWords: $searchWords, saveOn: $saveOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecentlySearchState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._searchWords, _searchWords) &&
            (identical(other.saveOn, saveOn) || other.saveOn == saveOn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_searchWords), saveOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecentlySearchStateCopyWith<_$_RecentlySearchState> get copyWith =>
      __$$_RecentlySearchStateCopyWithImpl<_$_RecentlySearchState>(
          this, _$identity);
}

abstract class _RecentlySearchState implements RecentlySearchState {
  factory _RecentlySearchState(
      {final RecentlySearchStatus status,
      final List<SearchWord> searchWords,
      final bool saveOn}) = _$_RecentlySearchState;

  @override
  RecentlySearchStatus get status;
  @override
  List<SearchWord> get searchWords;
  @override
  bool get saveOn;
  @override
  @JsonKey(ignore: true)
  _$$_RecentlySearchStateCopyWith<_$_RecentlySearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
