import 'package:flutter/material.dart';

//Sign up button UI

class MyButton extends StatelessWidget {
  final Function()? onTap;
  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text("Sign in", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
