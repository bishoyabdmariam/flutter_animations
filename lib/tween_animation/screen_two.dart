import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Two"),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: IntTween(begin: 0, end: 100),
          duration: const Duration(milliseconds: 2000),
          builder: (context, value, child) {
            return Text(
              value.toString(),
              style: const TextStyle(
                color: Colors.green,
                fontSize: 50,
              ),
            );
          },
        ),
      ),
    );
  }
}
