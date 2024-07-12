import 'package:flutter/material.dart';

class AnimatedTextSequence extends StatefulWidget {
  const AnimatedTextSequence({super.key});

  @override
  _AnimatedTextSequenceState createState() => _AnimatedTextSequenceState();
}

class _AnimatedTextSequenceState extends State<AnimatedTextSequence>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fontSizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: true);

    _fontSizeAnimation = _createFontSizeAnimation(_controller);
  }

  Animation<double> _createFontSizeAnimation(AnimationController controller) {
    // Define a list of font sizes
    List<double> fontSizes = [
      10.0,
      12.0,
      14.0,
      16.0,
      18.0,
      20.0,
      22.0,
      24.0,
      26.0,
      28.0,
      30.0,
      32.0,
      34.0,
      36.0,
      38.0,
      40.0,
      42.0,
      44.0,
      46.0,
      48.0,
    ];

    // Create a list of TweenSequenceItems
    List<TweenSequenceItem<double>> tweenItems = <TweenSequenceItem<double>>[];
    for (int i = 0; i < fontSizes.length - 1; i++) {
      final beginSize = fontSizes[i];
      final endSize = fontSizes[i + 1];
      final tweenSequenceItem = TweenSequenceItem(
        tween: Tween<double>(begin: beginSize, end: endSize),
        weight: 1, // Equal weight for uniform transition duration
      );
      tweenItems.add(tweenSequenceItem);
    }

    // Create the TweenSequence and animate it with the controller
    return TweenSequence<double>(tweenItems).animate(controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _fontSizeAnimation,
      builder: (context, child) {
        return Scaffold(
            body: Center(
          child: Text(
            'Animated Text Size',
            style: TextStyle(
              fontSize: _fontSizeAnimation
                  .value, // Apply the animated font size value
              color: Colors.black, // Static color for demonstration
            ),
          ),
        ));
      },
    );
  }
}
