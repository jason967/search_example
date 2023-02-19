import 'package:hive_flutter/hive_flutter.dart';

part 'search_word.g.dart';

@HiveType(typeId: 0)
class SearchWord {
  @HiveField(0)
  String name;
  @HiveField(1, defaultValue: '')
  String url;
  SearchWord(this.name, this.url);
}
