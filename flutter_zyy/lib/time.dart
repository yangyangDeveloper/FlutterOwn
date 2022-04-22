
import 'package:http/http.dart' as http;
import 'dart:convert';

class Time {

  String time = "";
  final String location;
  final String flag;
  final String url;

  Time({required this.location, required this.flag, required this.url});

  // 用Future 包装可以后面用 await 调用
  Future<void> getData() async {
    // var geturl = Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Ashgabat');
    // final response = await http.get(geturl);
    // Map data = jsonDecode(response.body);
    // print(data);
    // String? datetime = data['datetime'];
    // String? offset = data['utc_offset'];
    //
    // DateTime now = DateTime.parse(datetime ?? "");
    //
    // int hour = int.parse(offset!.substring(0, 3));
    // now = now.add(Duration(hours: hour));
    // time = now.toString();


    try {
      var geturl = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      final response = await http.get(geturl);
      Map data = jsonDecode(response.body);
      String? datetime = data['datetime'];
      String? offset = data['utc_offset'];

      DateTime now = DateTime.parse(datetime ?? "");

      int hour = int.parse(offset!.substring(0, 3));
      now = now.add(Duration(hours: hour));
      time = now.toString();

    } catch(e) {
      print('error: $e');
      time = "cant get time";
    }
  }
}

/*

URI from string
To create a URI from string, use Uri.parse or Uri.tryParse:
final uri = Uri.parse(
    'https://dart.dev/guides/libraries/library-tour#utility-classes');

 */
/*
var httpsUri = Uri(
    scheme: 'https',
    host: 'dart.dev',
    path: '/guides/libraries/library-tour',
    fragment: 'numbers');
    print(httpsUri); // https://dart.dev/guides/libraries/library-tour#numbers

httpsUri = Uri(
  scheme: 'https',
  host: 'example.com',
  path: '/page/',
  queryParameters: {'search': 'blue', 'limit': '10'});
  print(httpsUri); // https://example.com/page/?search=blue&limit=10

final mailtoUri = Uri(
    scheme: 'mailto',
    path: 'John.Doe@example.com',
    queryParameters: {'subject': 'Example'});
    print(mailtoUri); // mailto:John.Doe@example.com?subject=Example
*/