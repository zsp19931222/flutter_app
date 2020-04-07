import 'package:flutter/material.dart';
import 'package:flutterapp/WidgetStateManagement.dart';
import 'package:flutterapp/scroll/CustomScrollViewWidget.dart';
import 'package:flutterapp/scroll/GridViewWidget.dart';
import 'package:flutterapp/scroll/ListViewWidget.dart';
import 'package:flutterapp/scroll/ScrollControllerWidget.dart';
import 'package:flutterapp/scroll/SingleChildScrollView.dart';

import 'container/Container.dart';
import 'container/DecoratedBox.dart';
import 'container/Padding.dart';
import 'container/ScaffoldRoute.dart';
import 'container/SizeLimit.dart';
import 'container/Transform.dart';
import 'event/MyGestureDetector.dart';
import 'event/NotificationWidget.dart';
import 'event/PointerEventWidget.dart';
import 'functionality/InheritedWidget.dart';
import 'functionality/ThemeWidget.dart';
import 'functionality/UpdateUIWiget.dart';
import 'functionality/WillPopScopeWidget.dart';
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
      body: SingleChildScrollView(
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
              textColor: Colors.red,
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
              textColor: Colors.blueGrey,
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
            FlatButton(
              child: Text("填充"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PaddingWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("尺寸限制类容器"),
              textColor: Colors.lightGreen,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SizeLimitWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("装饰容器"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DecoratedBoxWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("变换"),
              textColor: Colors.lightGreen,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TransformWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("组合类容器"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ContainerWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("主页"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ScaffoldRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("可滚动组件"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SingleChildScrollViewWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("可滚动组件(ListView)"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListViewWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("可滚动组件(GridView)"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GridViewWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("可滚动组件(GridView+ListView)"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CustomScrollViewWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("滑动监控"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ScrollControllerWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("返回拦截"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WillPopScopeWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("数据共享"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyInheritedWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("颜色和主题"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ThemeWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("路由换肤功能"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ThemeTestRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("异步更新UI(FutureBuilder)"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UpdateUIWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("异步更新UI(StreamBuilder)"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StreamBuilderWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("原始指针事件处理"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PointerEventWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("手势识别(点击、双击、长按)"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GestureDetectorWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("手势识别(拖动、滑动)"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Drag();
                }));
              },
            ),
            FlatButton(
              child: Text("手势识别(单一方向拖动)"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DragVertical();
                }));
              },
            ),
            FlatButton(
              child: Text("手势识别(缩放)"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ScaleTestRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("手势识别(GestureRecognizer)"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GestureRecognizerTestRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("手势识别(竞争)"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BothDirectionTestRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("Notification"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyNotificationListener();
                }));
              },
            ),
            FlatButton(
              child: Text("Notification(自定义通知)"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NotificationRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("Notification(阻止冒泡)"),
              textColor: Colors.blueGrey,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NotificationRoute1();
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
