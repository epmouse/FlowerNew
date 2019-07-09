import 'package:flower_app/pages/page_webview.dart';
import 'package:flower_app/pages/page_search.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static Map<String, WidgetBuilder> getRoutes(){
     return <String, WidgetBuilder>{
         WebViewPage.routeName:(context)=> WebViewPage(),
         Search.routerName:(context) => Search(),
      };
  }
}