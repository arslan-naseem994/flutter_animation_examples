import 'package:flutter/material.dart';

class AnimatedColorText extends StatefulWidget {
  const AnimatedColorText({super.key});

  @override
  AnimatedColorTextState createState() => AnimatedColorTextState();
}

class AnimatedColorTextState extends State<AnimatedColorText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    // Define a list of colors
    List<Color> colors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.blue,
      Colors.lightBlue,
      Colors.cyan,
      Colors.teal,
      Colors.green,
      Colors.lightGreen,
      Colors.lime,
      Colors.yellow,
      Colors.amber,
      Colors.orange,
      Colors.deepOrange,
      Colors.brown,
      Colors.grey,
      Colors.blueGrey,
      Colors.black,
    ];

    // Create a list of TweenSequenceItems
    List<TweenSequenceItem<Color?>> tweenItems = <TweenSequenceItem<Color?>>[];
    for (int i = 0; i < colors.length; i++) {
      final beginColor = colors[i];
      final endColor = colors[(i + 1) % colors.length];
      final tweenSequenceItem = TweenSequenceItem(
        tween: ColorTween(begin: beginColor, end: endColor),
        weight: 1, // Equal weight for uniform transition duration
      );
      tweenItems.add(tweenSequenceItem);
    }

    // Create the TweenSequence and animate it with the controller
    var colorTweenSequence = TweenSequence<Color?>(tweenItems);
    _colorAnimation = _controller.drive(colorTweenSequence);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Scaffold(
          body: Center(
            child: Text(
              'Animated Colors',
              style: TextStyle(
                fontSize: 30,
                color: _colorAnimation.value, // Apply the animated color value
              ),
            ),
          ),
        );
      },
    );
  }
}
