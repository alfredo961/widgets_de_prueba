import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar/animation_view/animation_controller.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
        ),
        floatingActionButton: const FloatingBounce());
  }
}

const _movement = 25.0;

class FloatingBounce extends StatefulWidget {
  const FloatingBounce({Key? key}) : super(key: key);

  @override
  _FloatingBounceState createState() => _FloatingBounceState();
}

class _FloatingBounceState extends State<FloatingBounce>
    with SingleTickerProviderStateMixin {
  final AnimacionController acontroller = Get.put(AnimacionController());
  late AnimationController? _controller;
  late Animation? _animationIn;
  late Animation? _animationOut;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2000,
      ),
    );

    _animationIn = CurveTween(
      curve: const Interval(
        0.1,
        0.5,
        curve: Curves.decelerate,
      ),
    ).animate(_controller!);

    _animationOut = CurveTween(
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.bounceOut,
      ),
    ).animate(_controller!);

    setState(() {
      _controller!.forward(from: 0.0);
      final TickerFuture tickerFuture = _controller!.repeat();
      tickerFuture.timeout(const Duration(seconds: 4), onTimeout: () {
        _controller!.forward(from: 0);
        _controller!.stop();
      });
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double currentElevation = 0.0;

    return AnimatedBuilder(
        animation: _controller!,
        builder: (context, _) {
          currentElevation = -_movement * _animationIn!.value +
              _movement * _animationOut!.value;
          return GestureDetector(
            onTap: () {
              setState(() {
                _controller!.forward(from: 0.0);
              });
            },
            child: Transform.translate(
              offset: Offset(0.0, currentElevation),
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                child: Icon(Icons.star),
              ),
            ),
          );
        });
  }
}

/*
FloatingActionButton(
              heroTag: "animation",
              child: Icon(Icons.star),
              onPressed: () {
                setState(() {
                  _controller.forward(from: 0.3);
                  print(_animationIn.value);
                  print(_animationOut.value);
                  print(currentElevation);
                });
              },
            ),
 */