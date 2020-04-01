import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditTextAndFromWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("输入框和from表单"),
      ),
      body: Column(
        children: <Widget>[
          UserNameWidget(),
          TextField(
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock)),
            onChanged: (v) {
              //onChanged是专门用于监听文本变化
              print("onChange: $v");
            },
            obscureText: true,
          ),
        ],
      ),
    );
  }
}

class UserNameWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserNameState();
  }
}

class UserNameState extends State<UserNameWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        TextField(
          autofocus: true,
          decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person)),
          controller:
              _unameController, //controller的功能却多一些，除了能监听文本变化外，它还可以设置默认值、选择文本
        ),
      ],
    );
  }

  @override
  void initState() {
    _unameController.text="hello world!";
    _unameController.selection=TextSelection(
        baseOffset: 2,
        extentOffset: _unameController.text.length
    );
    //监听输入改变
    _unameController.addListener(() {
      print("initState:" + _unameController.text);
    });

  }
}

//定义一个controller
TextEditingController _unameController = TextEditingController();
