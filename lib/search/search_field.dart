import 'dart:developer';

import 'package:bloc_example/model/search/search_word.dart';
import 'package:bloc_example/search/recenlty_search_bloc/recently_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../main_app_bar/main_app_bar_btn.dart';

class SearchField extends StatefulWidget {
  const SearchField({required this.saveOn, super.key});
  final bool saveOn;
  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _textController = TextEditingController();
  final _textFocus = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  final searchBox = Hive.box<SearchWord>('search_word');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 20),
            child: TextField(
                controller: _textController,
                focusNode: _textFocus,
                decoration: const InputDecoration(
                  labelText: '원하는 상품을 검색해 보세요',
                  hintText: '원하는 상품을 검색해 보세요',
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: Colors.green),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                keyboardType: TextInputType.text,
                onSubmitted: (text) {
                  final word = SearchWord(text, 'sample url ');

                  context.read<RecentlySearchBloc>().add(
                        RecentlySearchSearched(
                            saveOn: widget.saveOn, word: word),
                      );
                  _textController.clear();
                  log('[test] onSubmitted : $text ');
                }),
          ),
        ),
        MainAppBarBtn(
          Icons.search,
          color: Colors.black,
          onTap: () {
            final text = _textController.text;
            if (text.isNotEmpty) {
              log('[test] btn onSubmitted : $text ');

              final word = SearchWord(text, 'sample url ');
              context.read<RecentlySearchBloc>().add(
                  RecentlySearchSearched(saveOn: widget.saveOn, word: word));
              _textController.clear();
              _textFocus.unfocus();
            }
          },
        ),
      ],
    );
  }
}
