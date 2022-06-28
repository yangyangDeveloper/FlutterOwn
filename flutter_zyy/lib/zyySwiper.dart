import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

///  轮播图
class zyySwiper extends StatefulWidget {
  const zyySwiper({Key? key}) : super(key: key);

  @override
  _zyySwiperState createState() => _zyySwiperState();
}

class _zyySwiperState extends State<zyySwiper> {

  List _imageurls =[
    'https://i.ibb.co/ym2R1R7/child-river-dreams-127495-1920x1080.jpg',
    'https://i.ibb.co/FBp1LW8/girl-umbrella-rain-151317-1280x720.jpg',
    'https://i.ibb.co/Yk8C22T/wallhaven-2el5zg.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children:<Widget> [
            Container(
              height: 220,
              //使用Swiper轮播图插件
              child: Swiper(
                itemCount: _imageurls.length,     //轮播图的数量
                autoplay: true,                  //轮播图滚动
                itemBuilder: (BuildContext context,int index){
                  //Image.network方法是导入网络图片
                  return Image.network(
                    _imageurls[index],
                    fit: BoxFit.fill,
                  );
                },
                pagination: SwiperPagination(),   //轮播图的小圆点
              ),
            )
          ],
        ),
      ),
    );
  }
}
