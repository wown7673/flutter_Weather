import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스크린B'),
      ),
      body: Center(
        child: Text('스크린B',style: TextStyle(
          fontSize: 24,
        )),
      ),
    );
  }
}
