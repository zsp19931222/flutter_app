import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("填充"),
      ),
      body: Padding(
        //上下左右各添加16像素补白
        padding: EdgeInsets.all(0),
        child: Column(
          //显式指定对齐方式为左对齐，排除对齐干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              //左边添加8像素补白
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Hello world"),
            ),
            Padding(
              //上下各添加8像素补白
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    child: Text("I"),
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  Text("am"),
                  Text("jack"),
                ],
              ),
            ),
            Padding(
              // 分别指定四个方向的补白
              padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
              child: Text("Your friend"),
            ),
          ],
        ),
      ),
    );
  }
}
