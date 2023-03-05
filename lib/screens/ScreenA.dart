import 'package:flutter/material.dart';

class ScreenA extends StatefulWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {

  @override
  void initState() {
    // TODO: implement initState
    print('initState()');
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('dispose()');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스크린A'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.red)
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/b');
              },
              child: Text('스크린B로 이동'),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.yellow)
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/c');
              },
              child: Text('스크린C로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
