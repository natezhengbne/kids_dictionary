import 'package:floor/floor.dart';
import 'package:kids_dictionary/common/model/word_details.dart';

@dao
abstract class WordDao{
  @Query('SELECT * FROM WordDetails')
  Future<List<WordDetails>> findAllWords();

  ///Query arguments, when using SQLite's LIKE operator,
  ///have to be supplied by the input of a method.
  ///It's not possible to define a pattern matching argument like %foo% in the query itself.
  @Query('SELECT * FROM WordDetails where headWord like :fuzzy')
  Future<List<WordDetails>> findWords(String fuzzy);

}