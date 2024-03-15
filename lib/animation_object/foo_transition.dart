import 'package:flutter/material.dart';

class FooTransition extends StatefulWidget {
  const FooTransition({super.key});

  @override
  State<FooTransition> createState() => _FooTransitionState();
}

class _FooTransitionState extends State<FooTransition>
    with SingleTickerProviderStateMixin {
  late Animation<AlignmentGeometry> _yellowAnimation;
  late AnimationController _yellowController;

  @override
  void initState() {
    super.initState();

    AnimationStatus.reverse;

    _yellowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    );
    _yellowAnimation = Tween<AlignmentGeometry>(
            begin: Alignment.topCenter, end: Alignment.bottomCenter)
        .animate(_yellowController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Foo Transition",
        ),
      ),
      body: Center(
        child: Column(
          children: [
            _stackWidgets(),
            _controlButtons(),
          ],
        ),
      ),
    );
  }

  Widget _stackWidgets() {
    return Expanded(
      child: Stack(
        children: [
          AlignTransition(
            alignment: _yellowAnimation,
            child: const CircleAvatar(
              backgroundColor: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }

  Widget _controlButtons() {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            _yellowController.value == 0
                ? _yellowController.forward()
                : _yellowController.reverse();
          },
          child: const Text(
            "Animate",
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            _yellowController.addStatusListener(_statusListener);
          },
          child: const Text(
            "Add Status Listener",
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            _yellowController.removeStatusListener(_statusListener);
          },
          child: const Text(
            "Remove Status Listener",
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text(
            "Add Status Listener",
          ),
        ),
      ],
    );
  }

  _statusListener(AnimationStatus animationStatus) {
    print(animationStatus);
  }
}
