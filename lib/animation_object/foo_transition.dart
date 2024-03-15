import 'package:flutter/material.dart';

class FooTransition extends StatefulWidget {
  const FooTransition({super.key});

  @override
  State<FooTransition> createState() => _FooTransitionState();
}

class _FooTransitionState extends State<FooTransition>
    with TickerProviderStateMixin {
  late Animation<AlignmentGeometry> _greenAnimation;
  late Animation<AlignmentGeometry> _yellowAnimation;
  late AnimationController _yellowController;
  late AnimationController _greenController;

  @override
  void initState() {
    super.initState();

    AnimationStatus.reverse;

    _greenController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    );
    _yellowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    );
    _yellowAnimation = Tween<AlignmentGeometry>(
            begin: Alignment.topCenter, end: Alignment.bottomCenter)
        .animate(_yellowController);
    _greenAnimation = Tween<AlignmentGeometry>(
            begin: Alignment.centerLeft, end: Alignment.centerRight)
        .animate(
      CurvedAnimation(
        parent: _greenController,
        curve: Curves.easeInOutBack,
        reverseCurve: Curves.easeInOutCirc,
      ),
    );

    _greenController.addStatusListener((status) {
      print('_greenController $status');
      if (status == AnimationStatus.completed||status == AnimationStatus.dismissed) {
        if (_yellowController.status != AnimationStatus.completed) {
          _yellowController.forward();
        } else {
          _yellowController.reverse();
        }
      }
    });

    _yellowController.addStatusListener((status) {
      print('_yellowController $status');
      if (status == AnimationStatus.completed||status == AnimationStatus.dismissed) {
        if (_greenController.status != AnimationStatus.completed) {
          _greenController.forward();
        } else {
          _greenController.reverse();
        }
      }
    });
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
            alignment: _greenAnimation,
            child: const CircleAvatar(
              backgroundColor: Colors.green,
            ),
          ),
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
            _greenController.forward();
          },
          child: const Text(
            "forward",
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            _greenController.reverse();
          },
          child: const Text(
            "reverse",
          ),
        ),
      ],
    );
  }
}
