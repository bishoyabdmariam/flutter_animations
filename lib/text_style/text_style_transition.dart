import 'package:flutter/material.dart';

class TransitionTextStyle extends StatefulWidget {
  const TransitionTextStyle({super.key});

  @override
  State<TransitionTextStyle> createState() => _TransitionTextStyleState();
}

class _TransitionTextStyleState extends State<TransitionTextStyle>
    with SingleTickerProviderStateMixin {
  late Animation<TextStyle> turns;

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    );
    turns = TextStyleTween(
        begin: const TextStyle(
          fontSize: 90,
          color: Colors.yellow,
        ),
        end: const TextStyle(
          fontSize: 50,
          color: Colors.green,
        )).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TransitionTextStyle"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          DefaultTextStyleTransition(
            style: turns,
            child: const Text(
              "Text Style Transition",
            ),
          ),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                animationController.value == 0
                    ? animationController.forward()
                    : animationController.reverse();
              },
              child: const Text("Animate")),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
