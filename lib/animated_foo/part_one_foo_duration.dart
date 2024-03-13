import 'package:flutter/material.dart';

class PartOneFoo extends StatefulWidget {
  const PartOneFoo({super.key});

  @override
  State<PartOneFoo> createState() => _PartOneFooState();
}

class _PartOneFooState extends State<PartOneFoo> {
  double dimension = 100;
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text(
          "Animation foo episode one",
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            AnimatedContainer(
              width: dimension,
              height: dimension,
              curve: Curves.bounceIn,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              duration: const Duration(
                milliseconds: 800,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                dimension = (dimension == 200) ? 100 : 200;
                color = (color == Colors.black) ? Colors.white: Colors.black;
                setState(() {

                });
              },
              child: const Text(
                "Start Animation",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
