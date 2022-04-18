
import 'dart:ui';
import 'package:flutter/material.dart';

// 简单列表
class list2 extends StatelessWidget {
  const list2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('简单列表2'),
      ),
      body: new ListView(
        children: getListChildren(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(25.0),
        itemExtent: 50,
      ),
    );;
  }

  List<Widget> getListChildren() {
    return [new Text("第一条"), new Text("第二条"), new Text("第三条")];
  }

}
