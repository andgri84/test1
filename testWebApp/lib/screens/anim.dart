import 'package:flutter/material.dart';

class AnimationsTest extends StatefulWidget {
  @override
  AnimationTestState createState() => AnimationTestState();
}

class AnimationTestState extends State<AnimationsTest>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;
  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    animation = Tween(begin: -0.25, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller.stop();
            }
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    bool pressed=false;
    _controller.forward();
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Transform(
            transform: Matrix4.translationValues(
                animation.value * width, animation.value * height, 0.0),
            child: Center(
                child: 
                GestureDetector(onTap:(){
                setState(() {
                  pressed = !pressed;
                });

                },
                child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    width: pressed?100:300,
                    height: pressed?100:300,
                    color: Colors.blueAccent)),)
                ,
          );
        });
  }
}
