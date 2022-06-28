import 'package:flutter/material.dart';

class gridView extends StatefulWidget {
  const gridView({Key? key}) : super(key: key);

  @override
  _gridViewState createState() => _gridViewState();
}

class _gridViewState extends State<gridView> {

  var a1 = {"imageUrl": "1.jpg", "title": "237"};
  var a2 = {"imageUrl": "1.jpg", "title": "237"};
  var a3 = {"imageUrl": "1.jpg", "title": "237"};
  var a4 = {"imageUrl": "1.jpg", "title": "237"};

  var listData = [
    {"imageUrl": "1.jpg", "title": "1"},
    {"imageUrl": "2.jpg", "title": "2"},
    {"imageUrl": "3.jpg", "title": "2"},
    {"imageUrl": "4.jpg", "title": "4"},
  ];

  List<Widget> _getData() {

    var tempList = listData.map((item) {
      var str =  item["imageUrl"];
      return Container(
        color: Colors.blue,
        child: Column(
          children: [
            Image.asset("assets/$str"),
            SizedBox(
              height: 20,
            ),
            Text(item["title"] ?? " "),
          ],
        ),
      );
    });

    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("生活"),
        centerTitle: true,
      ),
      body: GridView.count(
        // 设置交叉轴组件的数量
        crossAxisCount: 2,
        // 设置子组件列表
        children: this._getData(),
        // 设置交叉轴间距
        crossAxisSpacing: 20.0,
        // 设置主轴间距
        mainAxisSpacing: 20.0,
        // 设置整个组件的内边距
        padding: EdgeInsets.all(20),
        // 设置子组件的宽高比例
        // childAspectRatio: 0.7,
      ),
    );
  }
}
