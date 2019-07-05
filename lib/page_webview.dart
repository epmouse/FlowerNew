import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  static const routeName = '/webview';
  @override
  createState() {
    return WebViewPageState();
  }
}

class WebViewPageState extends State<WebViewPage> {

  WebViewArguments arguments;

  @override
  void initState() {
    super.initState();
    setStatusColor();
  }

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context).settings.arguments;
    return _getWebViewScaffold();
  }

  Widget _getWebViewScaffold() {
    if (arguments.isHideTitle) {
      //隐藏标题
      if (arguments.isHideStatus) {
        //并且隐藏状态栏
        return WebviewScaffold(
          url: arguments.url,
          withJavascript: true,
          scrollBar: false,
          withLocalUrl: true,
        );
      } else {
        return SafeArea(
            child: WebviewScaffold(
          url: arguments.url,
          withJavascript: true,
          scrollBar: false,
          withLocalUrl: true,
        ));
      }
    } else {
      return WebviewScaffold(
        url: arguments.url,
        withJavascript: true,
        scrollBar: false,
        withLocalUrl: true,
        appBar: AppBar(
          backgroundColor: arguments.titleColor,
          title: Text(arguments.title),
        ),
      );
    }
  }

  setStatusColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: arguments.titleColor,
        statusBarBrightness: arguments
            .statusBarFontColor //两种颜色，黑和白  Brightness.light   Brightness.dark
        ));
  }
}


class WebViewArguments{
  final String url;
  final String title;
  final Color titleColor;
  final Brightness statusBarFontColor;
  final bool isHideTitle;
  final bool isHideStatus;

  WebViewArguments(this.url,
      {this.title,
        this.titleColor,
        this.statusBarFontColor,
        this.isHideTitle,
        this.isHideStatus});
}