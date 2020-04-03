import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
///一些固定的但是会超过屏幕显示的可以用这个控件
class SingleChildScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("可滚动组件"),
      ),
      body: SingleChildScrollViewTestRoute(),
    );
  }
}

class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Scrollbar(
            // 显示进度条
            child: SingleChildScrollView(
              reverse: true,
              physics: BouncingScrollPhysics(), //iOS下弹性效果
              padding: EdgeInsets.all(16.0),
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Row(
                  //动态创建一个List<Widget>
                  children: str
                      .split("")
                      //每一个字母都用一个Text显示,字体为原来的两倍
                      .map((c) => Text(
                            c,
                            textScaleFactor: 2.0,
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                //动态创建一个List<Widget>
                children: str
                    .split("")
                    //每一个字母都用一个Text显示,字体为原来的两倍
                    .map((c) => Text(
                          c,
                          textScaleFactor: 2.0,
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
