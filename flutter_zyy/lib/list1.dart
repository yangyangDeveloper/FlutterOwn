import 'dart:ui';
import 'package:flutter/material.dart';

// 简单列表
class list1 extends StatelessWidget {
  const list1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('简单列表1'),
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
