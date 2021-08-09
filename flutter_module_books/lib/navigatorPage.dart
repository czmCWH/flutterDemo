import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module_books/Widget/text.dart';

import 'Widget/text.dart';
import 'Widget/container.dart';

class NavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: ElevatedButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text('返回'),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.orange), // 按钮的背景颜色
            ),
          ),
          title: Text("导航栈的首页"),
        ),
        body: Center(
          child: Text('导航控制的首页'),
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/containerPage': (BuildContext context) => ContainerPage(),
        '/textPage': (BuildContext context) => TextPage()
      },
    );
  }
}
