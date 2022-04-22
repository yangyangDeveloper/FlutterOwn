
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// 准备model
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({required this.userId, required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

  // 网络请求
  Future<Post> fetchPost() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    final response = await http.get(url);
    final responseJson = json.decode(response.body);
    return new Post.fromJson(responseJson);
  }

class zyyFetchPost extends StatefulWidget {
  const zyyFetchPost({Key? key}) : super(key: key);

  @override
  _zyyFetchPostState createState() => _zyyFetchPostState();
}

class _zyyFetchPostState extends State<zyyFetchPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fetch data example'),
      ),
      body: Center(
        child: FutureBuilder(
          future: fetchPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var str = snapshot.hasData.toString();
              print("11111");
              return Text(str);
            }else if (snapshot.hasError) {
              print("22222");
              return Text("${snapshot.error}");
            }
            print("33333");
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
