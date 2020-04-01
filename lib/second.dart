import 'package:flutter/material.dart';
import 'package:flutterapp/WidgetStateManagement.dart';

import 'generalcontrol/Button.dart';
import 'generalcontrol/EditTextAndFrom.dart';
import 'generalcontrol/ImageAndIcon.dart';
import 'generalcontrol/Progress.dart';
import 'generalcontrol/TextAndStyle.dart';
import 'layout/Align.dart';
import 'layout/FlowLayout.dart';
import 'layout/LinearLayout.dart';
import 'layout/StackLayout.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showEcho(),
            FlatButton(
              child: Text("跳转ContextRoute"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ContextRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("跳转Widget状态管理"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StateManagement();
                }));
              },
            ),
            FlatButton(
              child: Text("跳转文本及样式"),
              textColor: Colors.redAccent,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TextAndStyleWidget();
                }));
              },
            ),
            RaisedButton(
              child: Text("跳转按钮"),
              textColor: Colors.lightGreen,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ButtonWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("跳转图片和ICON"),
              textColor: Colors.red,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ImageAndIconWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("输入框和from表单"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditTextAndFromWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("进度条"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProgressWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("线性布局"),
              textColor: Colors.lightGreen,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LinearLayoutWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("流式布局"),
              textColor: Colors.lightGreen,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FlowLayoutWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("层叠布局"),
              textColor: Colors.lightGreen,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StackLayoutWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("对齐与相对定位"),
              textColor: Colors.lightGreen,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AlignWidget();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class showEcho extends Echo {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Echo(
      text: "自定义StatelessWidget",
      backgroundColor: Colors.amber,
    );
  }
}

//实现了一个回显字符串的Echo widget
class Echo extends StatelessWidget {
  //widget的构造函数参数应使用命名参数
  //命名参数中的必要参数要添加@required标注，这样有利于静态代码分析器进行检查
  //在继承widget时，第一个参数通常应该是Key
  //如果Widget需要接收子Widget，那么child或children参数通常应被放在参数列表的最后
  //Widget的属性应尽可能的被声明为final，防止被意外改变。
  const Echo({Key key, @required this.text, this.backgroundColor: Colors.grey})
      : super(key: key);
  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

class ContextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Context测试"),
      ),
      body: Container(
        child: Builder(builder: (context) {
          // 在Widget树中向上查找最近的父级`Scaffold` widget
          Scaffold scaffold = context.ancestorWidgetOfExactType(Scaffold);
          // 直接返回 AppBar的title， 此处实际上是Text("Context测试")
          return (scaffold.appBar as AppBar).title;
        }),
      ),
    );
  }
}
