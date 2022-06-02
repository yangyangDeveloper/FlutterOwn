import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class list7 extends StatefulWidget {
  const list7({Key? key}) : super(key: key);

  @override
  _list7State createState() => _list7State();
}

class MessageItem {
  String title;
  String body;
  MessageItem(this.title, this.body);
}

class _list7State extends State<list7> {

  SharedPreferences? sharedPreferences;

  List<MessageItem> items = [
    MessageItem('所属部门', '腾讯公司-科技'),
    MessageItem('姓名', '小明'),
    MessageItem('展示名称', 'yangyang'),
    MessageItem('性别', '男'),
    MessageItem('上级', ''),
    MessageItem('同事', '31人'),
  ];

  // 内容
  Widget _messageItem(BuildContext context, int index) {
    final item = items[index];
    return Container(
      height: 80,
      //color: Colors.red,
      //alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      decoration: BoxDecoration(color: Colors.white),
      child: Text(
        item.title,
        style: const TextStyle(
            color: Colors.grey, fontSize: 14, letterSpacing: 1),
      ),
    );
  }

  // 设置持久化数据
  void _setData() async {
    print("setdata");
    // 实例化
    sharedPreferences = await SharedPreferences.getInstance();

    // 设置string类型
    await sharedPreferences?.setString("name", "Jimi");

    // 设置int类型
    await sharedPreferences?.setInt("age", 18);

    // 设置bool类型
    await sharedPreferences?.setBool("isTeacher", true);

    // 设置double类型
    await sharedPreferences?.setDouble("height", 1.88);

    // 设置string类型的数组
    await sharedPreferences?.setStringList("action", ["吃饭", "睡觉", "打豆豆"]);

    //await sharedPreferences?.setStringList("action", ["吃饭666", "睡觉555", "打豆豆5555]);

    List<String> keys = sharedPreferences?.getStringList("action") ?? [];
    print("niubi");
    print(keys[0]);
    print(keys[1]);

    setState(() {});
  }

  List<Widget> getListChildren() {
    return [new Text("第一条:"), new Text("第二条"), new Text("第三条")];
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("SharedPreferences"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setData,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("名字: ${sharedPreferences?.getString("name") ?? ""}",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20
              ),
            ),
            SizedBox(height: 20,),
            Text("年龄: ${sharedPreferences?.getInt("age") ?? ""}",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20
              ),
            ),
            SizedBox(height: 20,),
            Text("是老师吗?: ${sharedPreferences?.getBool("isTeacher") ?? ""}",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20
              ),
            ),
            SizedBox(height: 20,),
            Text("身高: ${sharedPreferences?.getDouble("height") ?? ""}",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 20
              ),
            ),
            SizedBox(height: 20,),
            Text("我正在: ${sharedPreferences?.getStringList("action") ?? ""}",
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 20
              ),
            ),



            // Expanded(
            //   //解决 Column 中包含ListView 和其他 Container时候  ListView不显示的问题
            //   flex: 1,
            //   child: MediaQuery.removePadding(
            //     //解决listview顶部有个空白的问题。ListView 上默认的的 top-padding
            //     context: context,
            //     removeTop: true,
            //     child: ListView.builder(
            //       itemCount: items.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return _messageItem(context, index);
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
