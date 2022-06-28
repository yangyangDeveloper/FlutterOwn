import 'package:flutter/material.dart';

class sliverList extends StatefulWidget {
  const sliverList({Key? key}) : super(key: key);

  @override
  _sliverListState createState() => _sliverListState();
}

class _sliverListState extends State<sliverList> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[

          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background:
                Image.asset("images/Test.jpg",
                        fit: BoxFit.cover,
                ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
              child: PageView(
                children: [Text("1"), Text("2")],
              ),
            ),
          ),

          //List  高度相同优先 SliverFixedExtentList  如果不同，使用 SliverList    如果不需要粘连 使用listview
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate:  SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建列表项
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child:  Text('list item $index'),
                  );
                },
                childCount: 20
            ),
          ),


          // gridview
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver:  SliverGrid(
              //Grid
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建子widget
                  return  Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
