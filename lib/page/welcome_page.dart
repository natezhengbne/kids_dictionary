import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_dictionary/page/main_page.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return ControlledAnimation(
      duration: Duration(milliseconds: 400),
      tween: Tween(begin: 0.0, end: 80.0),
      builder: (context, height) {
        return ControlledAnimation(
          duration: Duration(milliseconds: 1200),
          delay: Duration(milliseconds: 500),
          tween: Tween(begin: 2.0, end: 300.0),
          animationControllerStatusListener: (status){
            if (status == AnimationStatus.completed) {
              Timer(Duration(milliseconds: 1200),
                      ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()),)
              );
            }
          },
          builder: (context, width) {
            return Center(
              child: Container(
                decoration: boxDecoration,
                width: width,
                height: height,
                child:  width > 20 ? TypewriterText("Kids Dictonary"): Container(),
              ),
            );
          },
        );
      },
    );
  }

  static final boxDecoration = BoxDecoration(
      color: Colors.pink,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Colors.white,
            blurRadius: 5,
            offset: Offset(0, 8),
            spreadRadius: 2)
      ]);
}

/// ----------------------------------
class TypewriterText extends StatelessWidget {
  static const TEXT_STYLE =
  TextStyle(letterSpacing: 5, fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);

  final String text;
  TypewriterText(this.text);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
        duration: Duration(milliseconds: 800),
        delay: Duration(milliseconds: 800),
        tween: IntTween(begin: 0, end: text.length),
        builder: (context, textLength) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text.substring(0, textLength), style: TEXT_STYLE),
              ControlledAnimation(
                playback: Playback.LOOP,
                duration: Duration(milliseconds: 600),
                tween: IntTween(begin: 0, end: 1),
                builder: (context, oneOrZero) {
                  return Opacity(
                      opacity: oneOrZero == 1 ? 1.0 : 0.0,
                      child: Text("_", style: TEXT_STYLE));
                },
              )
            ],
          );
        });
  }
}
