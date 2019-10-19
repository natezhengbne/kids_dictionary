import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_dictionary/common/model/word_details.dart';

class WordWidget extends StatelessWidget {
  final WordDetails wordDetails;
  WordWidget(this.wordDetails);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),

      ),
      child: Column(
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
        style: TextStyle(
          color: Colors.red,
          fontSize: ScreenUtil().setSp(32),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget definition(){
    if(wordDetails?.definition==null){
      return Container();
    }
    return Container(
      child: Text(wordDetails?.definition??"",
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(20),
        ),
      ),
    );
  }

  Widget extraInformation(){
    if(wordDetails?.extraInformation==null){
      return Container();
    }
    return Container(
      child: Text(wordDetails?.extraInformation??"",
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(20),
        ),
      ),
    );
  }

  Widget wordBuilding(){
    if(wordDetails?.wordBuilding==null){
      return Container();
    }
    return Container(
      child: Text(wordDetails?.wordBuilding??"",
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(20),
        ),
      ),
    );
  }

  Widget spellingAdvice(){
    if(wordDetails?.spillingAdvice==null){
      return Container();
    }
    return Container(
      child: Text(wordDetails?.spillingAdvice??"",
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(20),
        ),
      ),
    );
  }

  Widget pronunciation(){
    if(wordDetails?.pronunciation==null){
      return Container();
    }
    return Container(
      child: Text(wordDetails?.pronunciation??"",
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(20),
        ),
      ),
    );
  }

  Widget partOfSpeech(){
    return Container(
      child: Text(wordDetails?.partOfSpeech??"",
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(20),
        ),
      ),
    );
  }

  // inside


  Widget superScript(){
    return Container();
  }


}
