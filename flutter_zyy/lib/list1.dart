import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_zyy/Demo.dart';
// 简单列表
class list1 extends StatelessWidget {

  Todo todo;

  list1({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title;
    if(null== todo || todo.title.isEmpty){
      title = "第二个界面";
    }else{
      title = todo.title;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${title}'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          print(index);
          return Card(
            child: Container(
              height: 150,
              color: Colors.yellow,
              child: Text('$index'),
            ),
          );
        },
      ),
    );
  }
}
