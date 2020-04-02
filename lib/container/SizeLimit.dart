import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeLimitWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("尺寸限制类容器"),
      ),
      body: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity, //宽度尽可能大
              minHeight: 50.0, //最小高度为50像素,
              maxHeight: 80,
            ),
            child: Container(
              height: 70.0,
              child: redBox,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: SizedBox(width: 80.0, height: 80.0, child: redBox),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
                //父
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                  //子
                  child: redBox,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
                child: UnconstrainedBox( //“去除”父级限制
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                    child: redBox,
                  ),
                )
            )
          ),
        ],
      ),
    );
  }
}

Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);
