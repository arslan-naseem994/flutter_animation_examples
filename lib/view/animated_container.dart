import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class FallingObjectDemo extends StatefulWidget {
  const FallingObjectDemo({super.key});

  @override
  _FallingObjectDemoState createState() => _FallingObjectDemoState();
}

class _FallingObjectDemoState extends State<FallingObjectDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double _height;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    // We need to wait for the layout to be built before we can get the screen height
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _height = MediaQuery.of(context).size.height;

      // Adjust the simulation for a 10-second duration
      final simulation = GravitySimulation(
        9.81 * 0.5, // Adjust the acceleration to fit the 10-second duration
        0.0, // starting point, px
        _height, // end point, px (screen height)
        0.0, // starting velocity, px per second
      );

      _controller.animateWith(simulation);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Align(
            alignment: Alignment(0, _controller.value),
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }
}
