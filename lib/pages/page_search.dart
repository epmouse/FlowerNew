import 'package:flower_app/utils/util_status_bar.dart';
import 'package:flower_app/widgets/widget_search_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Search extends StatefulWidget {
  static const routerName = '/search';

  @override
  State<StatefulWidget> createState() => SearchState();
}

class SearchState extends State<Search> {
  SearchModel _arguments;

  @override
  void initState() {
    super.initState();
    print('Search--> initState');
  }

  @override
  Widget build(BuildContext context) {
    print('Search--> build');
    _arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Column(
        children: <Widget>[
          _getSearchTitle(),
        ],
      ),
    );
  }

  _getSearchTitle() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey[600])],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: _arguments.bgColor,
            height: StatusBarUtils.getStatusBarHeight(context),
          ),
          SearchTitleBar(
              bgColor: _arguments.bgColor,
              initSearchText: _arguments.initSearchText ?? ''),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('Search--> dispose');
  }
}

class SearchModel {
  final Color bgColor;
  final String initSearchText;
  final Color rightTextColor;
  final Brightness statusBarFontColor;

  SearchModel(
      {this.bgColor = Colors.white,
      this.initSearchText,
      this.rightTextColor,
      this.statusBarFontColor = Brightness.dark});
}
