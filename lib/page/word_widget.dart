import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_dictionary/common/model/word_details.dart';

class WordWidget extends StatelessWidget {
  final WordDetails wordDetails;
  WordWidget(this.wordDetails);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    list.add(headWord());
    if((wordDetails?.partOfSpeech?.length??0) > 0){
      list.add(Padding(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
        child: partOfSpeech(),
      ));
    }
    if((wordDetails?.pronunciation?.length??0) >0){
      list.add(Padding(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
        child: pronunciation(),
      ));
    }
    if((wordDetails?.definition?.length ??0) > 0){
      list.add(Padding(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
        child: definition(),
      ));
    }
    if((wordDetails?.wordBuilding?.length ??0) > 0){
      list.add(Padding(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
        child: wordBuilding(),
      ));
    }
    if((wordDetails?.extraInformation?.length ??0) > 0){
      list.add(Padding(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
        child: extraInformation(),
      ));
    }
    if((wordDetails?.spillingAdvice?.length ??0) > 0){
      list.add(Padding(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
        child: spellingAdvice(),
      ));
    }


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
        children: list,
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
    if(wordDetails.definition.contains("#-")){
      List<String> multiDefinitions = wordDetails.definition.split("#-");
      return Padding(
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(8), bottom: ScreenUtil().setHeight(8)),
        child: Column(
          children: List.generate(multiDefinitions.length, (index){
            return Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: ScreenUtil().setWidth(8)),
                    child: Text("${index+1}.",
                      softWrap: true,
                      style: TextStyle(
                          color: Colors.pink
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(multiDefinitions[index]),
                  ),
                ],
              ),
            );
          }),
        ),
      );
    }
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(8), bottom: ScreenUtil().setHeight(8)),
      child: Text(wordDetails?.definition,
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  Widget extraInformation(){
    return Container(
      child: Text(wordDetails?.extraInformation,
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  Widget wordBuilding(){

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
              text: wordDetails?.wordBuilding??"^",
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
              text: wordDetails?.spillingAdvice,
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

    return Container(
//      alignment: Alignment.centerLeft,
      child: Text(wordDetails?.pronunciation,
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  Widget partOfSpeech(){
    return Container(
      child: Text(wordDetails?.partOfSpeech,
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
