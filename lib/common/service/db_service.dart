import 'dart:io';

import 'package:flutter/services.dart';
import 'package:kids_dictionary/common/db/database.dart';
import 'package:kids_dictionary/common/model/word_details.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbService{
  static WordDatabase wordDatabase ;
  static List<WordDetails> headWordList ;
  static List<String> headWordStrList = [];

  static Future init()async{
    if(wordDatabase!=null){
      return;
    }
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'word_database.db');

    ByteData data = await rootBundle.load(join("assets", "word_database.db"));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    File dbFile = new File(path);
    await dbFile.writeAsBytes(bytes);

    wordDatabase = await $FloorWordDatabase.databaseBuilder('word_database.db').build();
    headWordList = await wordDatabase.wordDao.getAllHeadWords();

    if(headWordList==null){
      return;
    }
    for(WordDetails wordDetails in headWordList){
      headWordStrList.add(wordDetails.headWord);
    }
  }
}