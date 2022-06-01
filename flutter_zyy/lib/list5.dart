import 'package:flutter/material.dart';
import 'package:flutter_zyy/Browser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class list5 extends StatefulWidget {


  const list5({Key? key}) : super(key: key);


  @override
  _list5State createState() => _list5State();
}

// // 设置持久化数据
// void _setData() async {
//   // 实例化
//
//   final prefs = await SharedPreferences.getInstance();
//
//
//   // 设置string类型的数组
//   await prefs?.setStringList("action", ["web1", "web2", "web3"]);
//
//   //setState(() {});
// }

// saveStringListValue () async
// {
//   prefs = await SharedPreferences.getInstance();
//   prefs.setStringList("foodList", ["pizza", "burger", "sandwich"]);
// }

class _list5State extends State<list5> {

  int _counter = 1;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  //Loading counter value on start
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  //Incrementing counter after click
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list5"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()
        {
          _incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


// floatingActionButton: FloatingActionButton(
// onPressed: () {
// Navigator.of(context)
//     .push(new MaterialPageRoute(builder: (_) {
// return new  Browser(
// url: "https://flutter-io.cn/",
// title: "测试Flutterwebview",
// );
// }));
// _setData();
// },
// tooltip: '跳转webview',
// child: const Icon(Icons.update),
// ),