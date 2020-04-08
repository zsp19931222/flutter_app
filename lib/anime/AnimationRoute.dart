import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ScaleAnimationRoute(),
            ScaleAnimationRoute1(),
            ScaleAnimationRoute2()
          ],
        ),
      ),
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() => {});
      });
    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Image.asset("imgs/avatar.png",
          width: animation.value, height: animation.value),
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class ScaleAnimationRoute1 extends StatefulWidget {
  @override
  _ScaleAnimationRouteState1 createState() => new _ScaleAnimationRouteState1();
}

class _ScaleAnimationRouteState1 extends State<ScaleAnimationRoute1>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
//    return AnimatedImage(
//      animation: animation,
//    );
    return AnimatedBuilder(
      animation: animation,
      child: Image.asset("imgs/avatar.png"),
      builder: (BuildContext ctx, Widget child) {
        return new Center(
          child: Container(
            height: animation.value,
            width: animation.value,
            child: child,
          ),
        );
      },
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

///AnimatedWidget类封装了调用setState()的细节，并允许我们将widget分离出来
class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset("imgs/avatar.png",
          width: animation.value, height: animation.value),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value, width: animation.value, child: child);
          },
          child: child),
    );
  }
}

class ScaleAnimationRoute2 extends StatefulWidget {
  @override
  _ScaleAnimationRouteState2 createState() => new _ScaleAnimationRouteState2();
}

class _ScaleAnimationRouteState2 extends State<ScaleAnimationRoute2>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      child: Image.asset("imgs/avatar.png"),
      animation: animation,
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
