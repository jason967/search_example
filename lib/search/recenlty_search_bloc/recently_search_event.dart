part of 'recently_search_bloc.dart';

abstract class RecentlySearchEvent {
  const RecentlySearchEvent();
}

class RecentlySearchInitialized extends RecentlySearchEvent {
  const RecentlySearchInitialized();
}

class RecentlySearchSearched extends RecentlySearchEvent {
  const RecentlySearchSearched({required this.saveOn, required this.word});

  final bool saveOn;
  final SearchWord word;
}

class RecentlySearchCleared extends RecentlySearchEvent {
  const RecentlySearchCleared();
}

class RecentlySearchToggled extends RecentlySearchEvent {
  const RecentlySearchToggled({required this.saveOn});

  final bool saveOn;
}

class RecentlySearchToggleChanged extends RecentlySearchEvent {
  const RecentlySearchToggleChanged({
    required this.canChange,
    required this.saveOn,
  });

  final bool canChange;
  final bool saveOn;
}
