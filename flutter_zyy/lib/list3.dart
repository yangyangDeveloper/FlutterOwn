
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
    MessageItem('上级', 'yangyang'),
    MessageItem('同事', '31人'),
  ];


  // final items = List<ListItem>.generate( 9, (index)
  //     HeadingItem('部门')，
  //     MessageItem("Sender 1", "Message body 1"),
  //
  // // );
  //
  //   _cellForRow(BuildContext context, int index) {
  //
  //   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "1111",
      home: Scaffold(
        appBar: AppBar(
          title: Text('简单列表3'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            if (item is HeadingItem) {
              return ListTile(
                title: Text(item.heading),
              );
            } else if (item is MessageItem) {
                 return ListTile(
                   title: Text(item.title),
                   subtitle: Text(item.body),
                 );
            }
            return ListTile(title: Text('默认'));
          }
        )
      )
    );
  }
}

