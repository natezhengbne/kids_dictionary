import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_dictionary/common/service/db_service.dart';
import 'package:kids_dictionary/page/main_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init()async{
    await DbService.init();
    _animationController = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener((){
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()),);
        }
      });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container();
  }
}
