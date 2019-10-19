import 'package:flutter/widgets.dart';
import 'package:kids_dictionary/common/model/word_details.dart';
import 'package:kids_dictionary/page/word_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          WordWidget(WordDetails(1,"test","1","2","3","4","5","6","7","8")),
        ],
      ),
    );
  }
}
