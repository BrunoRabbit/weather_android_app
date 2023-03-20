import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  final Widget body;
  final LinearGradient? gradient;

  const GradientScaffold({
    Key? key,
    required this.body,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: gradient ??
                LinearGradient(
                  colors: [
                    const Color(0xFF241F2B),
                    Colors.grey[800]!,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
          ),
          child: body,
        ),
      );
}