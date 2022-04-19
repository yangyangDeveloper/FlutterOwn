
import 'dart:ui';
import 'package:flutter/material.dart';

// The base class for the different types of items the list can contain.

abstract class ListItem {}

// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  String heading;
  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  String title;
  String body;
  MessageItem(this.title, this.body);
}

class Box extends StatelessWidget {

  String index = '1';

  Box(String index) {
    this.index = index;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration (
        color: Colors.transparent,
      ),
      alignment: Alignment.center,
      child: Text(
          index,
          style: TextStyle(
            color: Colors.white,
             fontSize: 14,
          ),
      ),
    );
  }
}

class list3 extends StatelessWidget {
  list3({Key? key}) : super(key: key);

  List<ListItem> items = [
    HeadingItem('部门'),
    MessageItem('所属部门', '腾讯公司-科技'),
    HeadingItem('个人资料'),
    MessageItem('姓名', '小明'),
    MessageItem('展示名称', 'yangyang'),
    MessageItem('性别', '男'),
    HeadingItem('关系'),
    MessageItem('上级', ''),
    MessageItem('同事', '31人'),
  ];

  // 头部
  Widget _headingItem(BuildContext context, int index) {
    final item = items[index];

    if (item is HeadingItem) {
      return Container (
        //height: 40,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 247, 247, 247),
        ),
        child: ListTile(
            // 其实有默认值 好像是15
            //contentPadding: EdgeInsets.symmetric(horizontal: 0),
            textColor: Colors.red,
            title: Text(
              item.heading,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  letterSpacing: 1
              ),
            ),
          ),
        );
    }
    return Container();
  }

  // 内容
  Widget _messageItem(BuildContext context, int index) {
    final item = items[index];
    if (item is MessageItem) {
      return  Container(
        //height: 100,
        //alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: ListTile(
          title: Text(item.title,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                letterSpacing: 1
            ),
          ),
          subtitle: Text(item.body,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                letterSpacing: 1
            ),
          ),
        ),
      );
    }
    return Container();
  }

  // 头像
  Widget _iconItem(){

    return CircleAvatar (
      radius: 50,
      backgroundImage: AssetImage("assets/16502640932167.jpg"),
      child: Stack(
        children: [
          Align (
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.red,
              child: Icon(Icons.camera),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    print('width is $width; height is $height');
    Color c1 = Color.fromARGB(255, 48, 61, 79);

    return MaterialApp(
        title: "1111",
        home: Scaffold(
            appBar: null,
            body: Padding (
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column (
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  Container(
                    decoration: BoxDecoration(
                        color: c1,
                    ),
                    width: width,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _iconItem(),
                        Box('张洋洋'),
                        ],
                      ),
                    ),
                  //Divider(height: 100,color: Colors.white),
                  Expanded(  //解决 Column 中包含ListView 和其他 Container时候  ListView不显示的问题
                    flex: 1,
                    child: MediaQuery.removePadding( //解决listview顶部有个空白的问题。ListView 上默认的的 top-padding
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = items[index];
                          if (item is HeadingItem) {
                            return _headingItem(context, index);
                          }
                          else if (item is MessageItem) {
                            return _messageItem(context, index);
                          }
                          return Container();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}

