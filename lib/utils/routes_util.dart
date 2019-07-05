import 'package:flower_app/page_webview.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static Map<String, WidgetBuilder> getRoutes(){
     return <String, WidgetBuilder>{
         WebViewPage.routeName:(context)=> WebViewPage(),
      };
  }
}