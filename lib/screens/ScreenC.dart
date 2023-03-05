import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  const ScreenC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스크린C'),
      ),
      body: Center(
        child: Text('스크린C',style: TextStyle(
          fontSize: 24,
        )),
      ),
    );
  }
}