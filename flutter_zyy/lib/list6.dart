import 'package:flutter/material.dart';
import 'package:flutter_zyy/Browser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class list6 extends StatefulWidget {
  const list6({Key? key}) : super(key: key);

  @override
  _list6State createState() => _list6State();
}

// "https://flutter-io.cn/"
class _list6State extends State<list6> {

  SharedPreferences? prefs;
  TextEditingController controller = new TextEditingController();
  String name="";
  List<String> strs = [];

  void initState() {
    super.initState();
    print("initstate");
    _loadH5Url();
  }

  // 清空输入框
  reWrite() async{
    print('点击清空');
    controller.text = "";
    setState(() {

    });
  }

  // 加载缓存
  _loadH5Url() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> keys = prefs.getStringList("action") ?? [];
    strs = keys;
    setState(() {

    });
  }

  // 更新缓存
  saveH5Url() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> keys = prefs.getStringList("action") ?? [];
    strs = keys;
    print(controller.text.toString());
    strs.add(controller.text.toString());
    prefs.setStringList("action", strs);
    setState(() {

    });
  }

  // 清空缓存
  clearH5Url() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("action");
    strs.clear();
    print("清空缓存成功");
    setState(() {

    });
  }

  // 跳转h5
  go(String title) async{
    print("跳转url");
    print(title);
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return Browser(
        url: title,
        title: "测试Flutterwebview",
      );
    }));

    setState(() {

    });
  }

  // 创建缓存列表cell样式
  List<Widget> getListChildren() {
    if (strs.isEmpty) {
      return [Text("暂无缓存记录",
        style: TextStyle(
            color: Colors.black,
            fontSize: 15
        ),
      ),];
    }
    // 不为空
    List<Widget> tiles = [];
    for(var item in strs) {
      tiles.add(
        ListTile(
          title: Text(item,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () {
            go(item);
          },
        ),
      );
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Flutter缓存H5"),
      ),
      body:Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration (
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height:30,
              ),
              ElevatedButton(
                child:Text("跳转"),
                onPressed: ()
                {
                  go(controller.text);
                },
              ),

              ElevatedButton(
                child:Text("保存"),
                onPressed: ()
                {
                  saveH5Url();
                },
              ),

              ElevatedButton(
                child:Text("清空输入框"),
                onPressed: ()
                {
                  reWrite();
                },
              ),

              ElevatedButton(
                child:Text("清空缓存"),
                onPressed: ()
                {
                  clearH5Url();
                },
              ),

              SizedBox(height: 20,),

              const Text("h5历史记录",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20
                ),
              ),

              ListView(
                children: getListChildren(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(5.0),
                itemExtent: 50,
              ),
            ],
          )
      ),
    );;
  }
}


