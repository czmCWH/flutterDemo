import 'package:flutter/material.dart';

class NavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "第二个页面",
      home: Scaffold(
        body: Center(
          child: Text('这是第二个页面'),
        ),
      ),
    );
  }
}
