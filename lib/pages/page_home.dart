import 'package:flower_app/pages/page_search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('toSearch'),
          onPressed: () {
            Navigator.pushNamed(context, Search.routerName,
                arguments: SearchModel(
                    bgColor: Colors.white, initSearchText: '初始化文字',statusBarFontColor: Brightness.dark));
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
