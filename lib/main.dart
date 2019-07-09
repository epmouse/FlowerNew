import 'package:flower_app/model/model_bottom_nav.dart';
import 'package:flower_app/pages/page_flowers.dart';
import 'package:flower_app/pages/page_home.dart';
import 'package:flower_app/pages/page_knowlege.dart';
import 'package:flower_app/pages/page_me.dart';
import 'package:flower_app/pages/page_search.dart';
import 'package:flower_app/utils/routes_util.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainNavPage(),
      routes: MyRoutes.getRoutes(),
    );
  }
}

class MainNavPage extends StatefulWidget {
  final List<BottomNavModel> bottomItems;

  MainNavPage({this.bottomItems}) : super();

  @override
  _MainNavPageState createState() {
    return _MainNavPageState();
  }
}

class _MainNavPageState extends State<MainNavPage> {
  final pages = [Home(),Flowers(),Knowledge(),Me()];
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Theme.of(context).disabledColor,
          selectedItemColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.jumpToPage(index);
            });
          },
          items: _bottomNavItemBuild()),
      body: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _pageController,
        itemBuilder: (context, index) {
          return pages[index];
        },
        itemCount: pages.length,
      ),
    );
  }

  _bottomNavItemBuild() {
    if (widget.bottomItems == null)
      return _getDefaultBottomItems();
    else
      return _getRemoteItems();
  }

  _getDefaultBottomItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
      BottomNavigationBarItem(
          icon: Icon(Icons.local_florist), title: Text('花园')),
      BottomNavigationBarItem(
          icon: Icon(Icons.laptop_chromebook), title: Text('知识')),
      BottomNavigationBarItem(
          icon: Icon(Icons.accessibility_new), title: Text('我')),
    ];
  }

  ///下载远程图标
  _getRemoteItems() {}
}
