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

          bulidSliverAppBar(),

          builidSliverPadding(),

          // 横向滑动区域
          bulidSliverToBoxAdapter(),

          // 精选
          SliverToBoxAdapter(
            child: Container(
              decoration: new BoxDecoration(color: Colors.white),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              height: 40,
              child: Text("样样优选样样"),
            ),
          ),

          // 滚动悬浮固定
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegate.fixedHeight(
              //固定高度
              height: 50,
              child: buildHeader(),
            ),
          ),

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
                            //alignment: Alignment.centerLeft,
                            decoration: new BoxDecoration(color: Colors.green),
                            width: 300,
                            height: 300,
                            //color: Colors.green,
                            child: Image.asset(
                                "assets/life/life_tab_vip_icon.png"),
                          ),
                        ),

                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: new BoxDecoration(color: Colors.orange),
                          //width: 300,
                          height: 20,
                          //color: Colors.green,
                          child: Text('积分'),
                        ),

                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: new BoxDecoration(color: Colors.purple),
                          //width: 300,
                          height: 20,
                          //color: Colors.green,
                          child: Text('主标题'),
                        ),
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

  // 头
  Widget bulidSliverAppBar() {
    return SliverAppBar(
      floating: true,
      snap: true,
      pinned: true,
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        title: Text("生活"),
        //titlePadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
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
    );
  }

  // 推荐
  Widget builidSliverPadding() {
    final physicalWidth = MediaQuery.of(context).size.width;
    return SliverPadding(
      padding: const EdgeInsets.all(15.0),
      sliver: SliverGrid(
        //Grid
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //Grid按两列显示
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
          childAspectRatio: 2, // 设置宽高比
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            //创建子widget
            var t = index + 1;
            return Container(
              //height: 250,
              decoration: new BoxDecoration(color: Colors.red),
              width: physicalWidth - 20,
              alignment: Alignment.center,
              child: Image.asset("assets/life/life_tab_vip_icon.png"),
            );
          },
          childCount: 4,
        ),
      ),
    );
  }


  // 优秀
  Widget bulidSliverToBoxAdapter() {
    final physicalWidth = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Container(
          decoration: BoxDecoration(color: Colors.yellow),
          width: physicalWidth,
          height: 380,
          child: Column(
              // 排除Column 垂直默认居中对齐的干扰 从最左边开始
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.purple),
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                height: 35,
                                color: Colors.blue,
                                child: Image.asset(
                                    "assets/life/lifeTab_pay_vip_card_title_image.png"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                color: Colors.blueAccent,
                                child: Image.asset(
                                    "assets/life/life_tab_vip_icon.png"),
                              ),
                            ],
                          ),
                          Container(
                            //width: 100,
                            color: Colors.blueAccent,
                            child: Text("每天精彩多一点"),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(''), // 中间用Expanded控件
                      ),
                      Container(
                        width: 100,
                        height: 36,
                        //在此设置
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: const LinearGradient(colors: [
                            Color(0xffFFF2E2),
                            Color(0xffFEE1C1),
                          ]),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            '开通记录',
                            style:
                                TextStyle(fontSize: 15, color: Colors.orange),
                          ),
                          style: ButtonStyle(
                            //去除阴影
                            elevation: MaterialStateProperty.all(0),
                            //将按钮背景设置为透明
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: physicalWidth, //指定列表高度为400
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    // 设置间隔
                    separatorBuilder: (BuildContext context, int index) =>
                        VerticalDivider(
                      width: 10.0,
                      color: Color(0xFFFFFFFF),
                    ),
                    itemBuilder: (context, index) {
                      final kScreenWidth = MediaQuery.of(context).size.width;
                      final itemWidth = 162.5 / 375 * kScreenWidth;
                      final itemHeight = 247 / 162.5 * itemWidth;
                      return Container(
                        decoration: new BoxDecoration(color: Colors.red),
                        // width: itemWidth,
                        // height: itemHeight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Container(
                              decoration:
                                  new BoxDecoration(color: Colors.black),
                              child: Stack(
                                children: [
                                  Container(
                                      decoration:
                                          new BoxDecoration(color: Colors.blue),
                                      width: itemWidth,
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                          "assets/life/life_tab_vip_icon.png")),
                                  Positioned(
                                    left: 5,
                                    top: 5,
                                    child: Container(
                                      color: Colors.green,
                                      child: Text("+50066666"),
                                    ),
                                  ),
                                  Positioned(
                                    left: 5,
                                    bottom: 5,
                                    child: Container(
                                      color: Colors.green,
                                      child: Text("669元"),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            Container(
                              decoration:
                                  new BoxDecoration(color: Colors.purple),
                              alignment: Alignment.centerLeft,
                              //height: 30,
                              child: Text("高端高端高端"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(color: Colors.white),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  height: 40,
                  child: Text("我有兑换码"),
                ),
              ])),
    );
  }

  // header
  Widget buildHeader() {
    return Container(
      color: Colors.lightBlue.shade200,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            child: Text("111"),
            onPressed: () {},
          ),
          TextButton(
            child: Text("222"),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
