import 'package:flutter/material.dart';

// 线性布局 Row和Column

/*
    textDirection 默认从左到右
    mainAxisSize  主轴方向占用的空间，默认是MainAxisSize.max  主轴默认占用最大的空间
    mainAxisAlignment   主轴对齐方式  默认start开始
    verticalDirection   对齐方向  默认是VerticalDirection.down，表示从上到下
    crossAxisAlignment  子轴对齐方式  crossAxisAlignment的参考系是verticalDirection
       verticalDirection值为VerticalDirection.down时    crossAxisAlignment.start指顶部对齐
       verticalDirection值为VerticalDirection.up时，     crossAxisAlignment.start指底部对齐
 */

class rowColumLayout extends StatefulWidget {
  const rowColumLayout({Key? key}) : super(key: key);

  @override
  _rowColumLayoutState createState() => _rowColumLayoutState();
}

class _rowColumLayoutState extends State<rowColumLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局（Row和Column）"),
      ),
      body:Column(
        //测试Row对齐方式，排除Column默认居中对齐的干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            // 设置 mainAxisSize 下面就无效了
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(" hello world2222 "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text(" hello world ", style: TextStyle(fontSize: 30.0),),
              Text(" I am Jack "),
            ],
          ),
        ],
      ),
    );
  }
}
