part of 'recently_search_bloc.dart';

@freezed
class RecentlySearchState with _$RecentlySearchState {
  factory RecentlySearchState({
    @Default(RecentlySearchStatus.initial) RecentlySearchStatus status,
    @Default(<SearchWord>[]) List<SearchWord> searchWords,
    @Default(false) bool saveOn,
  }) = _RecentlySearchState;
}
