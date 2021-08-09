import 'package:flutter/material.dart';
import 'onePage.dart';
import 'navigatorPage.dart';

// 默认Dart的入口
void main() => runApp(MyApp());

// 指定Dart的入口
@pragma('vm:entry-point')
void oneEntrypoint() => runApp(OnePage());

// 指定Dart的入口
@pragma('vm:entry-point')
void navigatorEntrypoint() {
  runApp(NavigatorPage());
}

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

class OtherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'text widget',
      home: Scaffold(
        body: Container(
          width: 200.0,
          height: 200.0,
          margin: const EdgeInsets.fromLTRB(50, 200, 0, 0),
          padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
          color: Colors.orange,
          alignment: Alignment.centerRight,
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.red,
            alignment: Alignment.centerLeft,
          ),
        ),
      ),
    );
  }
}




/*

> 1、为什么 Flutter 在设计的时候 StatefulWidget 的 build 方法放在 State 中
    1. build 出来的 Widget 是需要依赖 State 中的变量(状态/数据)
    2. 在 Flutter 的运行过程中：
      Widget 是不断的销毁和创建的
      当我们自己的状态发生改变时，并不希望重新创建一个新的 State

> 2、调用 FlutterEngine 的 run() 函数，默认会调用 lib/main.dart 文件里的 main() 函数。
 如果通过官方文档中的 flutterEngine.run(withEntrypoint: "twoEntrypoint", libraryURI: "twoPage.dart") 方式来指定不同文件中某个入口函数，这样是无法找到的，
 flutter github issues 中有介绍，必须把其它文件中的入口函数写在main.dart文件中才有效。

*/