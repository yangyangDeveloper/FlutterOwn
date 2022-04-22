
// import 'package:flutter/material.dart';
// import 'cardpage.dart';
// import 'list1.dart';
// import 'list2.dart';
// import 'list3.dart';
// import 'list4.dart';
// import 'uidemo1.dart';
// import 'Demo.dart';
//
// final routes = {
//    '/':(context)=>Demo(),
//   // '/form':(context)=>FormPage(),
//   '/list4':(context,{arguments}) =>list4(text:arguments),
// };
//
// //固定写法
// var onGenerateRoute=(RouteSettings settings) {
//   // 统一处理
//   final String name = settings.name;
//   final Function pageContentBuilder = routes[name];
//   if (pageContentBuilder != null) {
//     if (settings.arguments != null) {
//       final Route route = MaterialPageRoute(
//           builder: (context) =>
//               pageContentBuilder(context, arguments: settings.arguments));
//       return route;
//     }else{
//       final Route route = MaterialPageRoute(
//           builder: (context) =>
//               pageContentBuilder(context));
//       return route;
//     }
//   }
// };
