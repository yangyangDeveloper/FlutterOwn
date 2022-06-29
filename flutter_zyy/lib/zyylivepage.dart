import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'persistentHeader.dart';

const APPBAR_SCROLL_OFFSET = 150;

// 生活tab
class zyylivepage extends StatefulWidget {
  const zyylivepage({Key? key}) : super(key: key);

  @override
  _zyylivepageState createState() => _zyylivepageState();
}

class _zyylivepageState extends State<zyylivepage> {
  List _imageurls = [
    'https://i.ibb.co/ym2R1R7/child-river-dreams-127495-1920x1080.jpg',
    'https://i.ibb.co/FBp1LW8/girl-umbrella-rain-151317-1280x720.jpg',
    'https://i.ibb.co/Yk8C22T/wallhaven-2el5zg.jpg',
  ];

  //late TabController _tabController;

  @override
  void initState() {
    //_tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final physicalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("生活"),
              titlePadding: EdgeInsets.only(right: 120, bottom: 5),
              background: Container(
                height: 250,
                child: Swiper(
                  itemCount: _imageurls.length,
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      _imageurls[index],
                      fit: BoxFit.fill,
                    );
                  },
                  pagination: SwiperPagination(),
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              //Grid
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1, // 设置宽高比
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  var t = index + 1;

                  return Container(
                    //height: 250,
                    width: physicalWidth - 20,
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Image.asset("assets/$t.jpg"),
                  );
                },
                childCount: 4,
              ),
            ),
          ),

          // ListView(
          //   //itemExtent: 50,
          //   scrollDirection: Axis.horizontal,
          //   children: <Widget>[
          //     new Container(
          //       width: 160.0,
          //       color: Colors.red,
          //     ),
          //     new Container(
          //       width: 160.0,
          //       color: Colors.blue,
          //     ),
          //     new Container(
          //       width: 160.0,
          //       color: Colors.green,
          //     ),
          //     new Container(
          //       width: 160.0,
          //       color: Colors.yellow,
          //     ),
          //     new Container(
          //       width: 160.0,
          //       color: Colors.orange,
          //     ),
          //   ],
          // )
          //

          //横向滑动区域
          SliverToBoxAdapter(
            child: Container(
                decoration: new BoxDecoration(color: Colors.yellow),
                width: physicalWidth,
                height: 300,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("商品列表2"),
                      ListTile(title: Text("商品列表")),
                      SizedBox(
                        width: physicalWidth, //指定列表高度为400
                        height: 200,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          // 设置间隔
                          separatorBuilder: (BuildContext context, int index) =>
                              VerticalDivider(
                            width: 10.0,
                            color: Color(0xFFFFFFFF),
                          ),
                          itemBuilder: (context, index) {
                            final kScreenWidth =
                                MediaQuery.of(context).size.width;
                            final itemWidth = 162.5 / 375 * kScreenWidth;
                            final itemHeight = 247 / 162.5 * itemWidth;
                            return Container(
                              decoration: new BoxDecoration(color: Colors.red),
                              // width: itemWidth,
                              // height: itemHeight,
                              child: Image.asset(
                                  "assets/life/life_tab_vip_icon.png"),
                            );
                          },
                        ),
                      ),
                      Text("商品列表23333"),
                    ])),
          ),

          //
          // SliverPersistentHeader(
          //   delegate: _SilverAppBarDelegate(TabBar(
          //     labelColor: Colors.red,
          //     unselectedLabelColor: Colors.yellow,
          //     tabs: <Widget>[
          //       new Tab(
          //         text: "tab1",
          //       ),
          //       new Tab(
          //         text: "tab2",
          //       ),
          //       new Tab(
          //         text: "tab3",
          //       ),
          //     ],
          //   )),
          // ),

          // // 滚动悬浮固定
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegate.fixedHeight(
              //固定高度
              height: 80,
              child: buildHeader(2),
            ),
          ),

          //
          // SliverFillRemaining(        // 剩余补充内容TabBarView
          //   child: TabBarView(
          //     controller: this.tabController,
          //     children: <Widget>[
          //       Center(child: Text('Content of Home')),
          //       Center(child: Text('Content of Profile')),
          //     ],
          //   ),
          // ),

          // gridview
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              //Grid
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // 当某子布局需要沿着主轴填充高度时使用，外部包裹Expanded属性
                        Expanded(
                          child: Container(
                            width: 300,
                            height: 300,
                            color: Colors.green,
                            child: Image.asset("assets/life/life_tab_vip_icon.png"),
                          ),
                        ),
                        Text('主标题'),
                        Text('积分'),
                      ]);
                },
                childCount: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getListChildren() {
    return [new Text("第一条:"), new Text("第二条"), new Text("第三条")];
  }

  // 构建 header
  Widget buildHeader(int i) {
    return Container(
      color: Colors.lightBlue.shade200,
      alignment: Alignment.centerLeft,
      child: Text("PersistentHeader $i"),
    );
  }
}

class _SilverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SilverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
