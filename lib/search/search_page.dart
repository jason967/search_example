import 'package:bloc_example/model/search/search_word.dart';
import 'package:bloc_example/search/recenlty_search_bloc/recently_search_bloc.dart';
import 'package:bloc_example/search/search_field.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RecentlySearchBloc(
              RecentlySearchState(status: RecentlySearchStatus.initial))
            ..add(const RecentlySearchInitialized()),
        )
      ],
      child: const SearchView(),
    );
  }
}

final List<String> rcmdEvent = [
  '넉넉하게 1+1',
  '실시간 인기상품',
  '알들살뜰 마감세일',
  '와인25+ 추천'
];

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('검색어'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BlocConsumer<RecentlySearchBloc, RecentlySearchState>(
              listenWhen: (previous, current) =>
                  (current.status == RecentlySearchStatus.loading) &&
                  (previous.saveOn != current.saveOn),
              listener: (context, state) async {
                {
                  final saveOn = state.saveOn;
                  final canChange =
                      (await dialog(context: context, saveOn: saveOn)) ?? false;
                  await Future.delayed(Duration.zero, () {
                    context.read<RecentlySearchBloc>().add(
                          RecentlySearchToggleChanged(
                            canChange: canChange,
                            saveOn: saveOn,
                          ),
                        );
                  });
                }
              },
              builder: (context, state) {
                final saveOn = state.saveOn;
                return Column(
                  children: [
                    SearchField(saveOn: saveOn),
                    RcmdEvent(events: rcmdEvent),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            '최근 검색어',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Transform.scale(
                            scale: 0.6,
                            child: CupertinoSwitch(
                              value: saveOn,
                              onChanged: (saveOn) => context
                                  .read<RecentlySearchBloc>()
                                  .add(RecentlySearchToggled(saveOn: saveOn)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            BlocBuilder<RecentlySearchBloc, RecentlySearchState>(
                builder: (context, state) {
              final saveOn = state.saveOn;
              final searchWords = state.searchWords;
              switch (state.status) {
                case RecentlySearchStatus.initial:
                  return _RecentlySearchWords(
                      searchWords: searchWords, saveOn: saveOn);
                case RecentlySearchStatus.loading:
                  return _RecentlySearchWords(
                    searchWords: searchWords,
                    saveOn: saveOn,
                    isLoading: true,
                  );
                case RecentlySearchStatus.success:
                  return _RecentlySearchWords(
                      searchWords: searchWords, saveOn: saveOn);
                case RecentlySearchStatus.fail:
                  return Container();
              }
            }),
            Container(
              color: Colors.green,
              width: MediaQuery.of(context).size.width,
              height: 400,
            )
          ],
        ),
      ),
    );
  }
}

class RcmdEvent extends StatelessWidget {
  const RcmdEvent({required this.events, super.key});
  final List<String> events;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: events
            .map(
              (event) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  event,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _RecentlySearchWords extends StatelessWidget {
  const _RecentlySearchWords({
    required this.searchWords,
    this.saveOn = false,
    this.isLoading = false,
  });
  final List<SearchWord> searchWords;
  final bool saveOn;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      if (!saveOn) {
        return (searchWords.isNotEmpty)
            ? Wrap(
                children: searchWords
                    .map(
                      (e) => Container(
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 30,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                child: Row(
                  children: const [
                    Text('검색을 이용하시면 '),
                    Text(
                      '자동으로 검색어를 저장',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('합니다.'),
                  ],
                ),
              );
      } else {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          child: Row(
            children: const [
              Text('검색어 자동저장을 이용하시면 '),
              Text(
                '쇼핑 검색이 편리',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('해집니다.'),
            ],
          ),
        );
      }
    }
    return Center(
      child: (saveOn)
          ? (searchWords.isNotEmpty)
              ? Wrap(
                  children: searchWords
                      .map(
                        (e) => Container(
                          decoration: const BoxDecoration(
                            color: Colors.yellow,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 30,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 40,
                  child: Row(
                    children: const [
                      Text('검색을 이용하시면 '),
                      Text(
                        '자동으로 검색어를 저장',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('합니다.'),
                    ],
                  ),
                )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              child: Row(
                children: const [
                  Text('검색어 자동저장을 이용하시면'),
                  Text(
                    '쇼핑 검색이 편리',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('해집니다.'),
                ],
              ),
            ),
    );
  }
}

Future<bool?> dialog({
  required BuildContext context,
  required bool saveOn,
}) {
  final msg =
      (!saveOn) ? '검색어 자동저장 기능을 사용 중지하시겠습니까?' : '검색어 자동저장 기능을 사용하시겠습니까?';
  return showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      content: Text(msg),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsPadding: EdgeInsets.zero,
      actions: [
        Container(
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey))),
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DialogButton(
                  title: '취소',
                  onTap: () {
                    if (Navigator.canPop(ctx)) {
                      Navigator.pop(ctx, false);
                    }
                  }),
              Container(
                width: 1,
                color: Colors.grey,
              ),
              DialogButton(
                title: '확인',
                color: Colors.green,
                onTap: () {
                  if (Navigator.canPop(ctx)) {
                    Navigator.pop(ctx, true);
                  }
                },
              ),
            ],
          ),
        )
      ],
    ),
  );
}

class DialogButton extends StatelessWidget {
  const DialogButton({
    required this.title,
    required this.onTap,
    this.color = Colors.black,
    super.key,
  });
  final String title;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
