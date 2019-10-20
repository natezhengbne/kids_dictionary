
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef Future GoSearch(String inputValue);
class SearchBarWidget extends StatefulWidget {
  final GoSearch goSearch;
  SearchBarWidget({this.goSearch});
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}
class _SearchBarWidgetState extends State<SearchBarWidget>{
  Timer inputTimer;
  TextEditingController textEditingController;
  bool isDisplayClearButton = false;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
//        alignment: AlignmentDirectional.centerEnd,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
//            color: Colors.white70,
              child: TextField(
                autofocus: true,
                controller: textEditingController,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(32),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search here",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onChanged: (value){
                  if(value.length>0){
                    _goSearch(value);
                  }else{
                    setState(() {
                      isDisplayClearButton = false;
                    });
                  }
                },
              ),
            ),
          ),
          isDisplayClearButton?GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: (){
              textEditingController.clear();
              setState(() {
                isDisplayClearButton = false;
              });
            },
            child: Container(
//              padding: EdgeInsets.all(10),
              child: Icon(Icons.cancel),
            ),
          ):Container(),
        ],
      ),
    );
  }

  void _goSearch(String inputValue){
    inputTimer?.cancel();
    inputTimer = Timer(Duration(milliseconds: 220),
            ()=>widget.goSearch(inputValue)
    );
    if(!isDisplayClearButton){
      setState(() {
        isDisplayClearButton = true;
      });
    }
  }
}