import 'package:flutter/material.dart';

class flowList extends StatefulWidget {
  const flowList({Key? key}) : super(key: key);

  @override
  _flowListState createState() => _flowListState();
}

class _flowListState extends State<flowList> {


  List<String> items = [
    '部门',"1993","777","你是在",
  ];

  Widget _headingItem(BuildContext context, int index) {
    final item = items[index];
    return Row(
      children: <Widget>[
        Expanded(flex: 1, child: _buildDecoratedImage(index, item)),
        Expanded(flex: 1, child: _buildDecoratedImage(index+1, item)),
      ],
    );
  }

  Widget _buildDecoratedImage(int imageIndex, String item) {
    var index = imageIndex + 1;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 10, color: Colors.black38),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),
      ),
      margin: const EdgeInsets.all(4),
      child: new Column(
        children: [
          Image.asset("assets/$index.jpg"),
          Text(item),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('平分cell'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return _headingItem(context, index);
        },
      ),
    );
  }
}
