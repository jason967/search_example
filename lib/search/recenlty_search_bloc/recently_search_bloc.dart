import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../model/search/search_word.dart';

part 'recently_search_bloc.freezed.dart';

part 'recently_search_state.dart';
part 'recently_search_event.dart';

enum RecentlySearchStatus { initial, loading, success, fail }

class RecentlySearchBloc
    extends Bloc<RecentlySearchEvent, RecentlySearchState> {
  RecentlySearchBloc(super.initialState) {
    on<RecentlySearchInitialized>(_onInitialized);
    on<RecentlySearchSearched>(_onSearched);
    on<RecentlySearchCleared>(_onCleared);
    on<RecentlySearchToggled>(_onToggled);
    on<RecentlySearchToggleChanged>(_onToggleChanged);
  }
  final searchWordsBox = Hive.box<SearchWord>('search_word');

  Future<void> _onInitialized(
      RecentlySearchEvent event, Emitter<RecentlySearchState> emit) async {
    emit(state.copyWith(status: RecentlySearchStatus.loading));

    final searchWords = searchWordsBox.values.toList();

    emit(
      state.copyWith(
          status: RecentlySearchStatus.success, searchWords: searchWords),
    );
  }

  Future<void> _onSearched(
      RecentlySearchSearched event, Emitter<RecentlySearchState> emit) async {
    emit(state.copyWith(status: RecentlySearchStatus.loading));
    final word = event.word;

    if (event.saveOn) {
      await searchWordsBox.put(word.name, word);
    }
    final searchWords = searchWordsBox.values.toList();

    emit(
      state.copyWith(
          status: RecentlySearchStatus.success, searchWords: searchWords),
    );
  }

  Future<void> _onCleared(
      RecentlySearchEvent event, Emitter<RecentlySearchState> emit) async {
    emit(state.copyWith(status: RecentlySearchStatus.loading));

    await searchWordsBox.clear();
    final searchWords = searchWordsBox.values.toList();

    emit(
      state.copyWith(
          status: RecentlySearchStatus.success, searchWords: searchWords),
    );
  }

  Future<void> _onToggled(
      RecentlySearchToggled event, Emitter<RecentlySearchState> emit) async {
    final searchWords = searchWordsBox.values.toList();
    emit(
      state.copyWith(
        saveOn: event.saveOn,
        status: RecentlySearchStatus.loading,
        searchWords: searchWords,
      ),
    );
  }

  Future<void> _onToggleChanged(
    RecentlySearchToggleChanged event,
    Emitter<RecentlySearchState> emit,
  ) async {
    final canChange = event.canChange;
    final saveOn = event.saveOn;

    if (canChange && !saveOn) {
      await searchWordsBox.clear();
    }

    final searchWords = searchWordsBox.values.toList();

    emit(
      state.copyWith(
        saveOn: canChange ? saveOn : !saveOn,
        status: RecentlySearchStatus.initial,
        searchWords: searchWords,
      ),
    );
  }
}
