import 'dart:async';

import 'package:floor/floor.dart';
import 'package:kids_dictionary/common/dao/word_dao.dart';
import 'package:kids_dictionary/common/model/word_details.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';

part 'database.g.dart';

@Database(version: 1, entities: [WordDetails])
abstract class WordDatabase extends FloorDatabase {
  WordDao get wordDao;
}