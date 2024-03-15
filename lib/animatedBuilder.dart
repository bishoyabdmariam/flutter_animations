import 'package:flutter/material.dart';

class AnimationBuilders extends StatefulWidget {
  const AnimationBuilders({super.key});

  @override
  State<AnimationBuilders> createState() => _AnimationBuildersState();
}

class _AnimationBuildersState extends State<AnimationBuilders>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> animation;
  late AnimationController animationController;

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      reverseDuration: const Duration(seconds: 2),
    );
    animation = ColorTween(end: Colors.blue, begin: Colors.yellow)
        .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Animation Builder Technique",
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            AnimatedBuilder(
                animation: animationController,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Animated",
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      "Builder",
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      "Widget",
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                ),
                builder: (context, child) {
                  return Container(
                    height: 250,
                    width: 250,
                    color: animation.value,
                    child: child,
                  );
                }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    animationController.forward();
                  },
                  child: const Text(
                    "Forward",
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    animationController.reverse();
                  },
                  child: const Text(
                    "Reverse",
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    animationController.stop();
                  },
                  child: const Text(
                    "Stop",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
