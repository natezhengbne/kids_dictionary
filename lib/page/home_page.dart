import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:kids_dictionary/common/model/word_details.dart';
import 'package:kids_dictionary/common/service/db_service.dart';
import 'package:kids_dictionary/page/word_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  Future<List<WordDetails>> wordDetailsList;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    wordDetailsList = loadLuckyWords();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("------> HomePage 1");
    return FutureBuilder<List<WordDetails>>(
      future: wordDetailsList,
      builder: (BuildContext context, AsyncSnapshot<List<WordDetails>> snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Container();
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Container();
          case ConnectionState.done:
            List<WordDetails> list = snapshot.data;

            print("------> HomePage 2");
            return Container();
        }
        return Container(); // unreachable
      },
    );
  }

  Future<List<WordDetails>> loadLuckyWords() async{
    int wordsAmount = DbService?.headWordList?.length??0;
    if(wordsAmount==0){
      return [];
    }
    var rng = new Random();
    List<int> ids = [];
    for (var i = 0; i < 10; i++) {
      int idx = rng.nextInt(wordsAmount);
      int id = DbService?.headWordList[idx].id;
      ids.add(id);
    }
    return DbService.wordDatabase.wordDao.getWordsByIds(ids);
  }

}
