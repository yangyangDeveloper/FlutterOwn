
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  // https://jsonplaceholder.typicode.com/todos
  // 一次性请求 get
  void getData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map data = jsonDecode(response.body);
    print(data);
    print(data["title"]);
  }

  // 一次性请求 post
  void getData2() async {

    var url = Uri.parse('https://example.com/whatsit/create');
    var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }

  // 持有连线  post
  void getData3() async {
    var client = http.Client();
    try {
      var response = await client.post(
          Uri.https('example.com', 'whatsit/create'),
          body: {'name': 'doodle', 'color': 'blue'});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var uri = Uri.parse(decodedResponse['uri'] as String);
      print(await client.get(uri));
    } finally {
      client.close();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData3();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网络请求'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          //print(index);
          return Card(
            child: Container(
              height: 150,
              color: Colors.yellow,
              child: Text('$index'),
            ),
          );
        },
      ),
    );
  }
}
