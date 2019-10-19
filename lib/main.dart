import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_dictionary/common/service/db_service.dart';
import 'package:kids_dictionary/common/service/redux_service.dart';
import 'package:kids_dictionary/page/main_page.dart';
import 'package:kids_dictionary/page/welcome_page.dart';


main(){
  ErrorWidget.builder = (FlutterErrorDetails fed){
    return Scaffold(
      body: Text("A error has occured"),
    );
  };
  runApp(KidsDictionary());
}

class KidsDictionary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<StateController>(
      store: ReduxService.getStore(),
      child: MaterialApp(
        title: 'Kids Dictionary',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: true,
          body: WelcomePage(),
        ),
      ),
    );
  }


}

