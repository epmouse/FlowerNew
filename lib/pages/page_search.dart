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

  List<String> _searchResults = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Column(
        children: <Widget>[
          _getSearchTitle(),
          _getSearchListView(),
        ],
      ),
    );
  }

  _getSearchTitle() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
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
              initSearchText: _arguments.initSearchText ?? '',
              onChanged: (String result) {
                toSearch(result);

              }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// 输入框状态改变时调用搜索接口展示搜索结果
  _getSearchListView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_searchResults[index]),
        );
      },
      itemCount: _searchResults.length,
    );
  }
  /// 调用接口搜索
  void toSearch(String result) async {
    await Future.delayed(Duration(seconds: 3),(){
          _searchResults.add('$result >>>aaaaa');
          _searchResults.add('$result >>>bbbb');
          _searchResults.add('$result >>>ccccc');
          _searchResults.add('$result >>>ddddd');
          _searchResults.add('$result >>>eeeee');
          _searchResults.add('$result >>>fffff');
          _searchResults.add('$result >>>ggggg');
          _searchResults.add('$result >>>hhhhh');
          _searchResults.add('$result >>>iiiii');
          _searchResults.add('$result >>>jjjjj');
     });
    setState(() {

    });
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
