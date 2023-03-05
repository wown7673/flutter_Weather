import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
       //margin: EdgeInsets.all(20),
        //padding: EdgeInsets.all(30),
        color: Colors.blue,
        //height: 500,
        //width: 300,
        //child: aa(key: UniqueKey(1),)
      )

    );
  }
}

class aa extends StatelessWidget {
  const aa(Key? key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

