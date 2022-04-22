import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'time.dart';

class timedemo extends StatefulWidget {

   timedemo({Key? key}) : super(key: key);

  @override
  _timedemoState createState() => _timedemoState();
}

class _timedemoState extends State<timedemo> {

  String timestr = "获取时间";

  // 异步函数
  void getData() async {
    Time time = Time(location: "Asia", flag: "", url: "Asia/Ashgabat");
    // 卡住线程 等待异步结果
    await time.getData();
    print(time.time);
    setState(() {
      timestr = time.time;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('fetch data example'),
      ),
      body: Center (child:
        Text('$timestr'),
      ),
    );
  }
}
