import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransitionFade extends StatefulWidget {
  const TransitionFade({super.key});

  @override
  State<TransitionFade> createState() => _TransitionFadeState();
}

class _TransitionFadeState extends State<TransitionFade>
    with SingleTickerProviderStateMixin {
  late Animation<double> turns;

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    );
    turns = Tween<double>(begin: 0, end: 1).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TransitionFade"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          FadeTransition(
            opacity: turns,
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
                    animationController.reverse();
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
                    animationController.forward();
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
