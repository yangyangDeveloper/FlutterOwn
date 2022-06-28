import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'persistentHeader.dart';

const APPBAR_SCROLL_OFFSET=150;

// 生活tab
class zyylivepage extends StatefulWidget {
  const zyylivepage({Key? key}) : super(key: key);

  @override
  _zyylivepageState createState() => _zyylivepageState();
}

class _zyylivepageState extends State<zyylivepage> {

  double appBarAlpha = 0;

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  List _imageurls = [
    'https://i.ibb.co/ym2R1R7/child-river-dreams-127495-1920x1080.jpg',
    'https://i.ibb.co/FBp1LW8/girl-umbrella-rain-151317-1280x720.jpg',
    'https://i.ibb.co/Yk8C22T/wallhaven-2el5zg.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children:<Widget> [
            // 通知
            MediaQuery.removePadding(  // 用来去除顶部状态栏
              removeTop: true,
              context: context,
              child: NotificationListener(  // 用来检测滚动距离
                // ignore: missing_return
                onNotification: (scrollNotification) {

                  // switch (scrollNotification.runtimeType){
                  //   case ScrollStartNotification: print("开始滚动"); break;
                  //   case ScrollUpdateNotification: print("正在滚动"); break;
                  //   case ScrollEndNotification: print("滚动停止"); break;
                  //   case OverscrollNotification: print("滚动到边界"); break;
                  // }

                  if(scrollNotification != null && scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0){
                    print(scrollNotification.metrics.pixels);
                    _onScroll(scrollNotification.metrics.pixels);
                    return true;
                  }

                  return false;
                },
                child:CustomScrollView(
                  slivers: <Widget>[

                    // 轮播包装称sliver
                    SliverToBoxAdapter(
                      child: Container(
                          height: 250,
                          child: Swiper(
                            itemCount: _imageurls.length,
                            autoplay: true,
                            itemBuilder: (BuildContext context,int index){
                              return Image.network(
                                _imageurls[index],
                                fit: BoxFit.fill,
                              );
                            },
                            pagination: SwiperPagination(),
                          ),
                        ),
                      ),

                    //List  高度相同优先 SliverFixedExtentList  如果不同，使用 SliverList    如果不需要粘连 使用listview
                    SliverFixedExtentList(
                      itemExtent: 50.0,
                      delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            //创建列表项
                            return Container(
                              alignment: Alignment.center,
                              color: Colors.lightBlue[100 * (index % 9)],
                              child: Text('list item $index'),
                            );
                          },
                          childCount: 20
                      ),
                    ),

                    // 滚动悬浮固定
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverHeaderDelegate.fixedHeight( //固定高度
                        height: 150,
                        child: buildHeader(2),
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
                          childAspectRatio: 4.0,
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            //创建子widget
                            return Container(
                              alignment: Alignment.center,
                              color: Colors.cyan[100 * (index % 9)],
                              child: Text('grid item $index'),
                            );
                          },
                          childCount: 120,
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ),

            // 渐变导航
            Opacity(
              opacity: appBarAlpha,
              child: Container(
                height: 60,
                decoration: BoxDecoration(color: Colors.red),
                child: Center(
                  child: Padding(padding: EdgeInsets.only(top: 20),
                    child: Text('首页'),),
                ),
              ),
            )

          ],
        )
    );
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


//     return Scaffold(
//         body: Stack(
//           children:<Widget> [
//             MediaQuery.removePadding(  // 用来去除顶部状态栏
//               removeTop: true,
//               context: context,
//               child: NotificationListener(  // 用来检测滚动距离
//                 // ignore: missing_return
//                 onNotification: (scrollNotification) {
//                   if(scrollNotification != null && scrollNotification is ScrollUpdateNotification &&
//                       scrollNotification.depth == 0){
//                     _onScroll(scrollNotification.metrics.pixels);
//                     return true;
//                   }
//                   return false;
//                 },
//                 child: ListView(
//                   children: <Widget>[
//                     Container(
//                       height: 250,
//                       child: Swiper(
//                         itemCount: _imageurls.length,
//                         autoplay: true,
//                         itemBuilder: (BuildContext context,int index){
//                           return Image.network(
//                             _imageurls[index],
//                             fit: BoxFit.fill,
//                           );
//                         },
//                         pagination: SwiperPagination(),
//                       ),
//                     ),
//                     Container(
//                       height: 800,
//                       child: ListTile(
//                         title: Text('Hello World'),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//
//
//             Opacity(
//               opacity: appBarAlpha,
//               child: Container(
//                 height: 60,
//                 decoration: BoxDecoration(color: Colors.red),
//                 child: Center(
//                   child: Padding(padding: EdgeInsets.only(top: 20),
//                     child: Text('首页'),),
//                 ),
//               ),
//             )
//           ],
//         )
//     );
//   //}
// }
