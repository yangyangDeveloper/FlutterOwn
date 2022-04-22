import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zyy/list4.dart';
import 'cardpage.dart';
import 'list1.dart';
import 'list2.dart';
import 'list3.dart';
import 'list4.dart';
import 'uidemo1.dart';
import 'loading.dart';
import 'zyyFetchPost.dart';
import 'timedemo.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class Todo {
  String title = '';
}

class CellItem {
  String heading;
  CellItem(this.heading);
}

class _DemoState extends State<Demo> {
  List widgets = [];
  List<Todo> todos = [];

  List<CellItem> items = [
    CellItem('简单卡片1'),
    CellItem('简单列表1'),
    CellItem('简单列表2'),
    CellItem('列表+卡片'),
    CellItem('列表4'),
    CellItem('简单Stateful'),
    CellItem('网络请求'),
    CellItem('网络请求2'),
    CellItem('抓取时间'),
  ];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      widgets.add(_getRow(i));
      Todo todo = new Todo();
      todo.title = item.heading.toString();
      todos.add(todo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('flutter练手'),
      ),
      body: new ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return _getRow(position);
        },
      ),
    );
  }

  Widget _getRow(int i) {
    final item = items[i];
    return ListTile(
      onTap: ()  async {
        if (i == 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return cardpage();
          }));
        }

        if (i == 1) {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (BuildContext context) {
// //                  return new SecondApp(); //不传值的跳转
//             return list1(todo: todos[i]); //带传值的跳转
//           }));

          Navigator.pushNamed(context, "list1", arguments: todos[i]);
        }

        if (i == 2) {
          Navigator.pushNamed(context, "list2");

          // Navigator.push(context,
          //     MaterialPageRoute(builder: (BuildContext context) {
          //   return list2(); //带传值的跳转
          // }));
        }

        if (i == 3) {
          var result = await Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
                return list3(); //带传值的跳转
              }));
          print("路由列表3: $result");
        }

        if (i == 4) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return list4(title : "我是页面4",);
          }));

          Navigator.pushNamed(context, "list4", arguments: Object());
        }

        if (i == 5) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return uidemo1();
          }));
        }

        if (i == 6) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
                return loading();
              }));
        }

        if (i == 7) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
                return zyyFetchPost();
              }));
        }

        if (i == 8) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
                return timedemo();
              }));
        }

      },
      title: Text(
        item.heading,
        style: TextStyle(color: Colors.orange, fontSize: 14, letterSpacing: 1),
      ),
    );
  }
}
