import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_dictionary/common/service/db_service.dart';

class WordListPage extends StatelessWidget{
  const WordListPage();

  @override
  Widget build(BuildContext context) {
    print(DbService.headWordStrList.length);
    return Container(
      child: AlphabetListScrollView(
        strList: DbService.headWordStrList,
        showPreview: true,
        highlightTextStyle: TextStyle(
          color: Colors.pink,
          fontSize: ScreenUtil().setSp(36),
          fontWeight: FontWeight.w600,
        ),
        normalTextStyle: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(32),
        ),
        itemBuilder: (context, index) {
          String word = DbService.headWordStrList[index];
          return ListTile(
            title: Container(
              child: Text(word),
            ),
          );
        },
        indexedHeight: (i) {
          return 40;
        },
      ),
    );
  }
}
