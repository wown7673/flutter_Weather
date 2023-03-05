import 'package:flutter/material.dart';
import 'package:test01/my_button/MyButton.dart';


class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: _buildButton(),
    );
  }

  // Padding타입 -> Widget타입으로변경
  // _ 는 접근제어자 private역할을함. _붙히면 같은 파일 내에서만 접근가능
  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyButton(
              image: Image.asset('images/dice/dice1.png', width: 30, height: 30),
              text: Text('Login with Google', style: TextStyle(color: Colors.black87, fontSize: 15, ),),
              color: Colors.white,
              radious: 5,
              onPressed: () {}
          ),
          SizedBox(height: 10),

          MyButton(
              image: Image.asset('images/dice/dice2.png', width: 30, height: 30),
              text: Text('Login with Google', style: TextStyle(color: Colors.black87, fontSize: 15, ),),
              color: Colors.blue,
              radious: 5,
              onPressed: () {}
          ),
          SizedBox(height: 10),

          MyButton(
              image: Image.asset('images/dice/dice3.png', width: 30, height: 30),
              text: Text('Login with Google', style: TextStyle(color: Colors.black87, fontSize: 15, ),),
              color: Colors.redAccent,
              radious: 5,
              onPressed: () {}
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}


