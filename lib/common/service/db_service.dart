import 'dart:io';

import 'package:flutter/services.dart';
import 'package:kids_dictionary/common/db/database.dart';
import 'package:kids_dictionary/common/model/word_details.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbService{
  static WordDatabase wordDatabase ;

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
//    List<WordDetails> result = await database.wordDao.findAllWords();

  }
}