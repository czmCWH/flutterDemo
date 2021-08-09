import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
