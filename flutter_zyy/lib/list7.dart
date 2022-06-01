import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class list7 extends StatefulWidget {
  const list7({Key? key}) : super(key: key);

  @override
  _list7State createState() => _list7State();
}

class _list7State extends State<list7> {

  SharedPreferences? sharedPreferences;

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

    List<String> keys = sharedPreferences?.getKeys().toList() ?? [];
    print("niubi");
    print(keys);

    setState(() {});
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
          ],
        ),
      ),
    );
  }
}
