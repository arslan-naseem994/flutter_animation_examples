import 'package:flutter/material.dart';

class AnimatedStringSequence extends StatefulWidget {
  const AnimatedStringSequence({super.key});

  @override
  AnimatedStringSequenceState createState() => AnimatedStringSequenceState();
}

class AnimatedStringSequenceState extends State<AnimatedStringSequence>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _textIndexAnimation;
  final List<String> _textNames = [
    'Arslan',
    'Sajid',
    'Arsam',
    'Bilal',
    'Talha',
    'Danial',
    'Awais',
    'Zohair',
    'Ahmad',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _textIndexAnimation =
        IntTween(begin: 0, end: _textNames.length - 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _textIndexAnimation,
      builder: (BuildContext context, Widget? child) {
        String currentText = _textNames[_textIndexAnimation.value];
        return Scaffold(
          body: Center(
            child: Text(
              currentText,
              style: const TextStyle(
                fontSize: 50,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
