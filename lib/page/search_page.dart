import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_dictionary/common/dao/word_dao.dart';
import 'package:kids_dictionary/common/model/word_details.dart';
import 'package:kids_dictionary/common/service/db_service.dart';
import 'package:kids_dictionary/common/service/redux_service.dart';
import 'package:kids_dictionary/common/state/search_state.dart';
import 'package:kids_dictionary/page/search_bar_widget.dart';
import 'package:kids_dictionary/page/word_widget.dart';
import 'package:redux/redux.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        ReduxService.dispatch(SearchOnResultAction([]));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
//          leading: Container(
//            child: Icon(Icons.search),
//          ),
          title: SearchBarWidget(
            goSearch: (value) async{
              List<WordDetails> result = await DbService?.wordDatabase?.wordDao?.findWords("$value%")??[];
              if(result!=null && result.length>0){
                ReduxService.dispatch(SearchOnResultAction(result));
              }
            },
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              child: Center(
                child: Text("Cancel"),
              ),
            ),
          ],
        ),
        body: SearchResult(),
      ),
    );
  }
}

class SearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<StateController, SearchState>(
      converter: (Store<StateController> store) => store.state.searchState,
      builder: (ctx, searchState){
        List<WordDetails> list = searchState.wordDetailsList;
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: list?.length??0,
          itemBuilder: (context, index){
            WordDetails wordDetails = list[index];
            return Container(
              child: WordWidget(wordDetails),
            );
          },
        );
      },
    );
  }
}


