import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RotationAnimated extends StatefulWidget {
  const RotationAnimated({super.key});

  @override
  State<RotationAnimated> createState() => _RotationAnimatedState();
}

class _RotationAnimatedState extends State<RotationAnimated> {
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RotationAnimated"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          AnimatedRotation(
            alignment: Alignment.topCenter,
            curve: Curves.bounceInOut,
            duration: Duration(seconds: 1),
            turns: turns,
            child: Text(
              "data",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {
                turns --;
                setState(() {
                });
              }, icon: Icon(Icons.rotate_left,size: 50,)),
              SizedBox(
                width: 20,
              ),
              IconButton(onPressed: () {
                turns ++;
                setState(() {

                });
              }, icon: Icon(Icons.rotate_right,size: 50,)),
            ],
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}
