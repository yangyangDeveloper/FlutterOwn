
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//  更新 widget
class Solution1 extends StatefulWidget {
  const Solution1({Key? key}) : super(key: key);

  @override
  _Solution1State createState() => _Solution1State();
}

class _Solution1State extends State<Solution1> {

  int _pressedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('samele app'),
      ),
      body: Center(
        child: CupertinoButton(
          onPressed: () {
            setState(() {
              _pressedCount += 1;
            });
          },
          child: Text('hello'),
          padding: EdgeInsets.only(left: 100, right: 10),
          color: Colors.red,

        ),
      ),
    );
  }
}
