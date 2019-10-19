
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
      child:Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              textEditingController.clear();
            },
            child: Container(
              margin: EdgeInsets.all(5),
              child: Icon(Icons.cancel),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.white70,
            child: TextField(
              autofocus: true,
              controller: textEditingController,
              style: TextStyle(
                color: Colors.pink,
                fontSize: ScreenUtil().setSp(32),
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search here",
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              onChanged: (value){
                if(value.length>0){
                  _goSearch(value);
                }
              },
            ),
          ),

        ],
      ),
    );
  }

  void _goSearch(String inputValue){
    inputTimer?.cancel();
    inputTimer = Timer(Duration(milliseconds: 220),
            ()=>widget.goSearch(inputValue)
    );
  }
}