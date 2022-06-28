import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_zyy/Browser.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 列表分割线
// 分割线 + cell动态高度
class list8 extends StatefulWidget {
  const list8({Key? key}) : super(key: key);

  @override
  _list8State createState() => _list8State();
}

class _list8State extends State<list8> {

  @override
  Widget build(BuildContext context) {

    Widget divider1 = Divider(color: Colors.black,);

    return  Scaffold(
      appBar: AppBar(
        title: Text('列表分割线'),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) =>
            _messageItem(context, index),
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) {
          return divider1;
        }),
    );
  }

  List<String> items = [
    '部门','所属部门','所属部门222所属部门222所属部门222所属部门222所属部门所属部门222所属部门222所属部门222所属部门222222所属部门222所属部门222',
    '所属333部门',
  ];

  // 内容
  Widget _messageItem(BuildContext context, int index) {
    final item = items[index];

      return Container(
          //height: 80,
          //color: Colors.red,
          //alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                index.toString(),
                style: const TextStyle(
                    color: Colors.grey, fontSize: 14, letterSpacing: 1),
              ),

              SizedBox(height: 5,),
              Text(
                item,
                style:
                TextStyle(color: Colors.black, fontSize: 18, letterSpacing: 1),
              ),
            ],
          )
      );
    }
}

