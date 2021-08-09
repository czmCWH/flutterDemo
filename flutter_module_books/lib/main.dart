import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp 这个 Widget，是用于快速开发一个标准 material 的界面
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // 去掉控制界面右上角显示`debug`提示
      home: MyHomePage(naviTitle: 'One Home Page'),
    );
  }
}

// 定义一个有状态的组件，Stateful不能定义状态，它需要一个单独的 State 类来维护状态
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.naviTitle}) : super(key: key);

  // 所有的 Widget 类中都不能定义状态，类成员属性必须是final
  final String naviTitle;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// 创建一个单独的State类，来负责维护状态
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // 点击按钮事件
  void _incrementCounter() {
    // 修改数据，调用 setState() 通知界面在下一帧重新绘制
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold 是一个脚手架 Widget，用于搭建出带 AppBar 的界面
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.naviTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '你已经按下按钮:',
            ),
            Text(
              '$_counter 次',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


/*

> 1、为什么 Flutter 在设计的时候 StatefulWidget 的 build 方法放在 State 中
    1. build 出来的 Widget 是需要依赖 State 中的变量(状态/数据)
    2. 在 Flutter 的运行过程中：
      Widget 是不断的销毁和创建的
      当我们自己的状态发生改变时，并不希望重新创建一个新的 State

> 2、

*/