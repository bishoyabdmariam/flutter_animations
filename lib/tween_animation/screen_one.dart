import 'package:flutter/material.dart';
import 'package:flutter_animation/tween_animation/screen_two.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen One"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go To Screen Two"),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const ScreenTwo()));
          },
        ),
      ),
    );
  }
}
