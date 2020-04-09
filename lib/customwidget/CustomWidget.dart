import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GradientButtonRoute(),
            TurnBoxRoute(),
          ],
        ),
      )),
    );
  }
}

///自定义渐变按钮
///DecoratedBox可以支持背景色渐变和圆角，
///InkWell在手指按下有涟漪效果，
///所以我们可以通过组合DecoratedBox和InkWell来实现GradientButton
class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    @required this.child,
  });

  // 渐变色数组
  final List<Color> colors;

  // 按钮宽高
  final double width;
  final double height;

  final Widget child;
  final BorderRadius borderRadius;

  //点击回调
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GradientButtonRoute extends StatefulWidget {
  @override
  _GradientButtonRouteState createState() => _GradientButtonRouteState();
}

class _GradientButtonRouteState extends State<GradientButtonRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GradientButton(
            colors: [Colors.orange, Colors.red],
            height: 50.0,
            child: Text("Submit"),
            onPressed: onTap,
          ),
          GradientButton(
            height: 50.0,
            colors: [Colors.lightGreen, Colors.green[700]],
            child: Text("Submit"),
            onPressed: onTap,
          ),
          GradientButton(
            height: 50.0,
            colors: [Colors.lightBlue[300], Colors.blueAccent],
            child: Text("Submit"),
            onPressed: onTap,
          ),
        ],
      ),
    );
  }

  onTap() {
    print("button click");
  }
}

///可以以任意角度来旋转其子节点，而且可以在角度发生变化时执行一个动画以过渡到新状态，同时，我们可以手动指定动画速度
class TurnBox extends StatefulWidget {
  const TurnBox(
      {Key key,
      this.turns = .0, //旋转的“圈”数,一圈为360度，如0.25圈即90度
      this.speed = 200, //过渡动画执行的总时长
      this.child})
      : super(key: key);

  final double turns;
  final int speed;
  final Widget child;

  @override
  _TurnBoxState createState() => new _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, lowerBound: -double.infinity, upperBound: double.infinity);
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    //旋转角度发生变化时执行过渡动画
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(
        widget.turns,
        duration: Duration(milliseconds: widget.speed ?? 200),
        curve: Curves.easeOut,
      );
    }
  }
}

class TurnBoxRoute extends StatefulWidget {
  @override
  _TurnBoxRouteState createState() => new _TurnBoxRouteState();
}

class _TurnBoxRouteState extends State<TurnBoxRoute> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          TurnBox(
            turns: _turns,
            speed: 500,
            child: Icon(
              Icons.refresh,
              size: 50,
            ),
          ),
          TurnBox(
            turns: _turns,
            speed: 1000,
            child: Icon(
              Icons.refresh,
              size: 150.0,
            ),
          ),
          RaisedButton(
            child: Text("顺时针旋转1/5圈"),
            onPressed: () {
              setState(() {
                _turns += .2;
              });
            },
          ),
          RaisedButton(
            child: Text("逆时针旋转1/5圈"),
            onPressed: () {
              setState(() {
                _turns -= .2;
              });
            },
          )
        ],
      ),
    );
  }
}

class MyRichText extends StatefulWidget {
  MyRichText({
    Key key,
    this.text, // 文本字符串
    this.linkStyle, // url链接样式
  }) : super(key: key);

  final String text;
  final TextStyle linkStyle;

  @override
  _MyRichTextState createState() => _MyRichTextState();
}

class _MyRichTextState extends State<MyRichText> {
  TextSpan _textSpan;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: _textSpan,
    );
  }

  TextSpan parseText(String text) {
    // 耗时操作：解析文本字符串，构建出TextSpan。
    // 省略具体实现。
  }

  @override
  void initState() {
    _textSpan = parseText(widget.text);
    super.initState();
  }

  @override
  void didUpdateWidget(MyRichText oldWidget) {
    if (widget.text != oldWidget.text) {
      _textSpan = parseText(widget.text);
    }
    super.didUpdateWidget(oldWidget);
  }
}
