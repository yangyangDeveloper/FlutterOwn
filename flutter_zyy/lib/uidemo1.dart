import 'package:flutter/material.dart';

// 更新widgets
class uidemo1 extends StatefulWidget {
  const uidemo1({Key? key}) : super(key: key);

  @override
  _uidemo1State createState() => _uidemo1State();
}

class _uidemo1State extends State<uidemo1> {

  // 设置默认字体
  String textToShow = "i like you";
  void _updateText() {
    setState(() {
      textToShow = "you like me";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("调用异步函数");
    getData();
    print("testing调用异步函数");
  }

  // 声明getdata函数 为异步函数
  void getData() async {
    String username = await Future.delayed(Duration(seconds: 3),(){
      print("get data in 3 secondes");
      return "yangyang";
    });

    print("异步调用1");
    Future.delayed(Duration(seconds: 2),(){
      print("get data in 2 secondes");

    });
    print("异步调用2");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('statefulwidget'),
      ),
      body: Center(
        child: Text(textToShow),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'update text',
        child: const Icon(Icons.update),
      ),
    );
  }
}
