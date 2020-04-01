import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("层叠布局"),
        ),
        body: ConstrainedBox(
          //通过ConstrainedBox来确保Stack占满屏幕
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
            children: <Widget>[
              Container(
                child:
                    Text("Hello world", style: TextStyle(color: Colors.white)),
                color: Colors.red,
              ),
              Positioned(
                bottom: 18.0,
                child: Text("I am Jack"),
              ),
              Positioned(
                top: 28.0,
                child: Text("Your friend"),
              )
            ],
          ),
        ));
  }
}
