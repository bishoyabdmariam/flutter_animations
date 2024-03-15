import 'package:flutter/material.dart';
import 'package:flutter_animation/animated_foo/part_one_foo_duration.dart';
import 'package:flutter_animation/animation_object/foo_transition.dart';
import 'package:flutter_animation/tween_animation/screen_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FooTransition(),
    );
  }
}
