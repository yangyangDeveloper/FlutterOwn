import 'package:flutter/material.dart';

class wraplist extends StatefulWidget {
  const wraplist({Key? key}) : super(key: key);

  @override
  _wraplistState createState() => _wraplistState();
}

class _wraplistState extends State<wraplist> {

  Widget MyButton(String str) {
    return ElevatedButton(
      child: Text(str),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      child: Wrap(
        spacing: 10,
        runSpacing: 30,
        runAlignment: WrapAlignment.end,
        alignment: WrapAlignment.spaceAround,
        children: [
          MyButton("第一季"),
          MyButton("第二季"),
          MyButton("第一季长度不一样"),
          MyButton("第三季"),
          MyButton("第四季"),
          MyButton("第五季"),
          MyButton("第六季"),
          MyButton("第六季"),
          MyButton("第六季"),
          MyButton("第六季"),
          MyButton("第六季"),
          MyButton("第六季"),
        ],
      ),
    );
  }
}
