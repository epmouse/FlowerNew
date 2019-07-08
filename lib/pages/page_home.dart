import 'package:flower_app/utils/utils.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  final TextEditingController _textController =
      TextEditingController(text: '初始搜索文字');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _getSearchTitle(),
        ],
      ),
    );
  }

  _getSearchTitle() {
    return Container(
      height: 48 + Utils.getStatusBarHeight(context),
      color: Colors.green[300],
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.green[200],
            height: Utils.getStatusBarHeight(context),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _getInput(),
                ),
                GestureDetector(
                  onTap: () {
                    //todo 调用搜索接口
                  },
                  child: Text('搜索'),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 搜索框
  _getInput() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.only(left: 5, right: 10),
      alignment: Alignment.center,
      height: 32,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 20, left: 5),
              child: TextField(
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.left,
                controller: _textController,
                //初始搜索值（非hintText）
                autofocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (text) {
                  print(text);
                },
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _textController.text = '';
            },
            child: Icon(
              Icons.clear,
              color: Colors.grey,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
