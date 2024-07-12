import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animations/view/hero_animation/screen_two.dart';

class HeroesHomeScreen extends StatefulWidget {
  const HeroesHomeScreen({super.key});

  @override
  State<HeroesHomeScreen> createState() => _HeroesHomeScreenState();
}

class _HeroesHomeScreenState extends State<HeroesHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const ScreenTwo()),
              ),
            );
          },
          child: Hero(
            tag: '1122',
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.red,
              ),
              child: const Center(
                child: Image(
                  image: NetworkImage(
                      'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=600'),
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
