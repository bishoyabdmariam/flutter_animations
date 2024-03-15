import 'package:flutter/material.dart';

class OpacityAnimated extends StatefulWidget {
  const OpacityAnimated({super.key});

  @override
  State<OpacityAnimated> createState() => _OpacityAnimatedState();
}

class _OpacityAnimatedState extends State<OpacityAnimated> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OpacityAnimated"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          AnimatedOpacity(
            opacity: opacity,
            curve: Curves.bounceInOut,
            duration: const Duration(seconds: 1),
            child: const Text(
              "data",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    opacity = 1;
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.rotate_left,
                    size: 50,
                  )),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {
                    opacity = 0;
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.rotate_right,
                    size: 50,
                  )),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
