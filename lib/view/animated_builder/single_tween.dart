import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('AnimatedBuilder Demo')),
        body: const Center(child: AnimatedBuilderWidget()),
      ),
    );
  }
}

class AnimatedBuilderWidget extends StatefulWidget {
  const AnimatedBuilderWidget({super.key});

  @override
  AnimatedBuilderWidgetState createState() => AnimatedBuilderWidgetState();
}

class AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Color?> _colorAnimation; // Declare the Animation<Color>

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..repeat(reverse: true);
    _animation = Tween<double>(begin: 10, end: 50).animate(_controller);

    _colorAnimation = ColorTween(
      begin: Colors.black,
      end: Colors.orange,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
            color: Colors.white,
            child: Center(
                child: Text(
              '50% Discount',
              style: TextStyle(
                fontSize: _animation.value,
                color: _colorAnimation.value,
              ),
            )));
      },
    );
  }
}
