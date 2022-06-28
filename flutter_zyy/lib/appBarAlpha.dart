import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET=150;

class appBarAlpha extends StatefulWidget {
  const appBarAlpha({Key? key}) : super(key: key);

  @override
  _appBarAlphaState createState() => _appBarAlphaState();
}

class _appBarAlphaState extends State<appBarAlpha> {

  List _imageurls=[
    'https://i.ibb.co/ym2R1R7/child-river-dreams-127495-1920x1080.jpg',
    'https://i.ibb.co/FBp1LW8/girl-umbrella-rain-151317-1280x720.jpg',
    'https://i.ibb.co/Yk8C22T/wallhaven-2el5zg.jpg',
  ];

  double appBarAlpha=0;

  _onScroll(offset){
    double alpha=offset/APPBAR_SCROLL_OFFSET;
    if(alpha<0){
      alpha=0;
    }else if(alpha>1){
      alpha=1;
    }
    setState((){
      appBarAlpha=alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children:<Widget> [
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
                child: ListView(
                  children: <Widget>[
                    Container(
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
                    Container(
                      height: 800,
                      child: ListTile(
                        title: Text('Hello World'),
                      ),
                    )
                  ],
                ),

              ),
            ),


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
}

