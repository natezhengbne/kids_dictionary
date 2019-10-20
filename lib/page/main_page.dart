import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kids_dictionary/page/home_page.dart';
import 'package:kids_dictionary/page/search_page.dart';
import 'package:kids_dictionary/page/word_list_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with AutomaticKeepAliveClientMixin{
  final PageController _pageController = PageController();
  int currentPageIdx = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: topBar(),
        body: body(),
        bottomNavigationBar: bottomBar(),
      ),
    );
  }

  Widget topBar(){
    return AppBar(
      leading: Icon(Icons.search),
      centerTitle: false,
      titleSpacing: 0,
      title: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchPage()),
          );
        },
        child:  Container(
          margin: EdgeInsets.all(10),
          width: ScreenUtil.screenWidth*0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Text("Search Here"),
        ),
      ),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 15),
          child: Icon(Icons.face),
        ),
      ],
    );
  }

  Widget body(){
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[
        const HomePage(),
        const WordListPage(),
      ],
    );
  }

  Widget bottomBar(){
    return BottomNavigationBar(
      onTap: (idx){
        if(idx!=currentPageIdx){
          setState(() {
            currentPageIdx = idx;
          });
        }
        _pageController.jumpToPage(idx);

      },
      currentIndex: currentPageIdx,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit),
          activeIcon: Icon(Icons.radio),
          title: Text("hi"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store),
          activeIcon: Icon(Icons.android),
          title: Text("h1i"),
        ),
      ],
    );
  }


}
