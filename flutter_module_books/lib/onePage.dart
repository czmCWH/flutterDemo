import 'package:flutter/material.dart';

// 指定Dart的入口
// @pragma('vm:entry-point')
// void oneEntrypoint() => runApp(OnePage());

class OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "第一个页面",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("第一个页面"),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Text(
              '第一个页面',
            ),
          ],
        )),
      ),
    );
  }
}
