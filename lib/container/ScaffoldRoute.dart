import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/container/ClipTestRoute.dart';
import 'package:flutterapp/container/Padding.dart';
import 'package:flutterapp/container/SizeLimit.dart';

import 'Container.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text("App Name"),
        bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      drawer: MyDrawer(),
      //抽屉
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.red,
        onTap: _onItemTapped,
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: ClipTestRoute(),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.add),
          onPressed: _onAdd),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "imgs/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  var _list;

  MyWidget(this._list);

  @override
  State<StatefulWidget> createState() {
    return MyState(_list);
  }
}

class MyState extends State<MyWidget> {
  var txt;

  MyState(this.txt);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 50.0, left: 120.0),
      //容器外填充
      constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
      //卡片大小
      decoration: BoxDecoration(
          //背景装饰
          gradient: RadialGradient(
              //背景径向渐变
              colors: [Colors.red, Colors.orange],
              center: Alignment.topLeft,
              radius: .98),
          boxShadow: [
            //卡片阴影
            BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0)
          ]),
      transform: Matrix4.rotationZ(.2),
      //卡片倾斜变换
      alignment: Alignment.center,
      //卡片内文字居中
      child: Text(
        //卡片文字
        txt, style: TextStyle(color: Colors.white, fontSize: 40.0),
      ),
    );
  }
}
