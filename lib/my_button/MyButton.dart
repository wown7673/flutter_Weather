
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  MyButton({required this.image, required this.text, required this.color, required this.radious, required this.onPressed, Key? key}) : super(key: key);
  //const MyButton({Key? key}) : super(key: key);

  final Widget image;
  final Widget text;
  final Color color;
  final double radious;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radious))
          ),
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Row(
          // spaceEvenly를 하고 밑에 Opacity로 투명하게해서 글자가 가운데 위치하게하는 노하우!
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            image,
            text,
            Opacity(opacity: 0.0, child: Image.asset('images/dice/dice1.png',width: 30, height: 30))
          ],
        ),
      ),
    );
  }
}
