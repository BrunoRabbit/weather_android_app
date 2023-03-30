import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedWave extends StatelessWidget {
  const AnimatedWave({
    super.key,
    required AnimationController controller,
    required this.size,
  }) : _controller = controller;

  final AnimationController _controller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {

        // ? animated wave
        return ClipPath(
          clipper: BackgroundWave(_controller.value),
          child: Stack(
            children: [
              
              // ? Background Blue gradient
              Container(
                height: size.height * 0.6,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Color(0xFF1157BC), Color(0xFF2E9DE2)],
                  ),
                ),
              ),

              // ? Background Image
              Opacity(
                opacity: .4,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/sky.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BackgroundWave extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;

  BackgroundWave(this.move);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);

    double xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);

    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
