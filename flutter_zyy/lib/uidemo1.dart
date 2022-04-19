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
