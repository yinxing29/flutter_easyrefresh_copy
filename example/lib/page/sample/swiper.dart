import 'dart:async';

import 'package:example/widget/sample_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// Swiper示例
class SwiperPage extends StatefulWidget {
  @override
  SwiperPageState createState() {
    return SwiperPageState();
  }
}
class SwiperPageState extends State<SwiperPage> {
  // 条目总数
  int _count = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh.builder(
        builder: (context, physics, header, footer){
          List<Widget> _listWidget = [];
          _listWidget.add(
            SliverAppBar(
              expandedHeight: 100.0,
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text('Swiper'),
              ),
            )
          );

          if (header != null) {
            _listWidget.add(header);
          }

          _listWidget.add(
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 210.0,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return SampleListItem(direction: Axis.horizontal);
                    },
                    itemCount: 5,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    autoplay: true,
                  ),
                ),
              ]),
            )
          );

          _listWidget.add(
              SliverList(
                delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return SampleListItem();
                    },
                    childCount: _count
                ),
              )
          );

          if (footer != null) {
            _listWidget.add(footer);
          }

          return CustomScrollView(
            physics: physics,
            slivers: _listWidget,
          );
        },
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _count = 20;
            });
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _count += 20;
            });
          });
        },
      ),
    );
  }
}