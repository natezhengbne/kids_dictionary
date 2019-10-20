import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_dictionary/common/model/word_details.dart';

class WordWidget extends StatelessWidget {
  final WordDetails wordDetails;
  WordWidget(this.wordDetails);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ScreenUtil().setWidth(15)),
      padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Colors.grey[200],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          headWord(),
          partOfSpeech(),
          pronunciation(),
          definition(),
          wordBuilding(),
          extraInformation(),
          spellingAdvice(),
        ],
      ),
    );
  }

  Widget headWord(){
    return Container(
      child: Text(wordDetails.headWord,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.pinkAccent,
          fontSize: ScreenUtil().setSp(60),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget definition(){
//    if(wordDetails?.definition==null){
//      return Container();
//    }
    return Container(
      child: Text(wordDetails?.definition??"If so1mething is broad, it is very wide. the river is so broad.If something is broad, it is very wide. the river is so broad",
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  Widget extraInformation(){
//    if(wordDetails?.extraInformation==null){
//      return Container();
//    }
    return Container(
      child: Text(wordDetails?.extraInformation??"This world comes from an Aboriginal language of New south wales called kamilaroi",
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  Widget wordBuilding(){
//    if(wordDetails?.wordBuilding==null){
//      return Container();
//    }
    return Container(
      child: Text.rich(
        TextSpan(
          text: "Word Budiling: ",
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(30),
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: wordDetails?.wordBuilding??"broaden, verb if you make something more broad, you broaden it. - ",
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(30),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget spellingAdvice(){
//    if(wordDetails?.spillingAdvice==null){
//      return Container();
//    }
    return Container(
      child: Text.rich(
        TextSpan(
          text: "Spelling Tip: ",
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(30),
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: wordDetails?.spillingAdvice??"Remember  the oa spelling for the aw sound",
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(30),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pronunciation(){
    if(wordDetails?.pronunciation==null){
      return Container();
    }
    return Container(
//      alignment: Alignment.centerLeft,
      child: Text(wordDetails?.pronunciation??"",
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  Widget partOfSpeech(){
    return Container(
      child: Text(wordDetails?.partOfSpeech??"adjective",
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(30),
          fontStyle: FontStyle.italic
        ),
      ),
    );
  }

  // inside


  Widget superScript(){
    return Container();
  }


}
