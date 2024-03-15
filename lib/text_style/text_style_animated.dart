import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyleAnimated extends StatefulWidget {
  const TextStyleAnimated({super.key});

  @override
  State<TextStyleAnimated> createState() => _TextStyleAnimatedState();
}

class _TextStyleAnimatedState extends State<TextStyleAnimated> {
  bool x = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextStyleAnimated"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          AnimatedDefaultTextStyle(
            style: buildTextStyle(),
            curve: Curves.bounceInOut,
            duration: const Duration(seconds: 1),
            child: const Text(
              "Text Animation",
            ),
          ),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                buildTextStyle();
                x=!x;
                setState(() {

                });
              },
              child: Text("Animate")),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  TextStyle buildTextStyle() {
    return x
        ? const TextStyle(
            fontSize: 50,
            color: Colors.yellow,
          )
        : const TextStyle(
            fontSize: 50,
            color: Colors.green,
          );
  }
}
