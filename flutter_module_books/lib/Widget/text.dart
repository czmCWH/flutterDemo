import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'textWidget',
      home: Scaffold(
        appBar: AppBar(
          leading: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('返回'),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.orange), // 按钮的背景颜色
            ),
          ),
          title: Text("text widget的使用"),
        ),
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
