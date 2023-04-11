import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view_model.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class SemiCircleWidget extends StatelessWidget {
  const SemiCircleWidget(
    this.homeViewModel,
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  final HomeViewModel homeViewModel;
  final VisibilityViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Observer(
        builder: (context) {
          double? cloudiness = homeViewModel.userLocation!.results!
              .forecast![viewModel.currentIndex].cloudiness;

          // ? Animation + Custom Paint
          return CustomPaint(
            painter: SemiCircle(
              percentage: cloudiness ?? 0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ? Inside Custom Paint, Text and Percentage
                  const SizedBox(height: 5),

                  // ? Text
                  AppText(
                    "${cloudiness ?? 1}",
                    style: TextUtility.title.medium.copyWith(
                      color: Colors.black87,
                      fontFamily: 'Nunito-SemiBold',
                    ),
                  ),

                  // ? Percentage
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: AppText(
                      "Porcentagem",
                      style: TextUtility.body1.bold.copyWith(
                        color: Colors.grey,
                        fontFamily: 'Nunito-Light',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ? I thought the code is a bit complex so I thought I need to explain for the near future
// ! There are 2 semi-circles, I'll call them `sc`, scA(grey) and scB(purple), superimpose scB over scA respecting its spacing
class SemiCircle extends CustomPainter {
  double percentage;

  SemiCircle({
    required this.percentage,
  });

  final double semiArcSize = 140;
  final double startAngle = math.pi - 0.3;
  final double endAngle = 2 * math.pi;
  final double spacing = .16;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * .74);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8.0;

    // * Draw the 3 arcs with spacing
    final rect = Rect.fromCircle(center: center, radius: semiArcSize);
    final sweepAngle = (endAngle - startAngle - .2) / 4;

    // * Draw the 3 grey arcs (scA)
    paint.color = Colors.grey;
    for (int i = 0; i < 4; i++) {
      canvas.drawArc(rect, startAngle + i * sweepAngle + i * spacing,
          sweepAngle, false, paint);
    }

    // ! (scB)
    // * Calculates the end angle of the (scB) arc, based on the percentage entered
    // * I added `+ 0.[any]` to fix arc drawing issue when percentage is [0 - 100]%
    double spacingCompensation = spacing;
    double pointerAngle = _percentageCalc(spacingCompensation);

    paint.color = Colors.purple;

    // * For each arc, a for loop
    for (int i = 0; i < 4; i++) {
      final arcStartAngle = startAngle + i * sweepAngle + i * spacing;
      final arcEndAngle = arcStartAngle + sweepAngle;

      if (arcEndAngle <= pointerAngle) {
        // * basically it's saying: We are able to draw our arc on the right
        canvas.drawArc(rect, arcStartAngle, sweepAngle, false, paint);
      } else if (arcStartAngle <= pointerAngle) {
        // * We are painting
        canvas.drawArc(
            rect, arcStartAngle, pointerAngle - arcStartAngle, false, paint);
        break;
      }
    }
  }

  double _percentageCalc(double spacingCompensation) {
    double pointerAngle = 0.0;

    if (percentage <= 25) {
      pointerAngle = startAngle +
          percentage *
              (endAngle - startAngle - (spacingCompensation * .8)) /
              100;
    }
    if (percentage > 25 && percentage <= 50) {
      pointerAngle = .12 +
          startAngle +
          percentage *
              (endAngle - startAngle - (spacingCompensation * .8)) /
              100;
    }
    if (percentage > 50 && percentage <= 75) {
      pointerAngle = .26 +
          startAngle +
          percentage *
              (endAngle - startAngle - (spacingCompensation * .8)) /
              100;
    }
    if (percentage > 75) {
      pointerAngle = .42 +
          startAngle +
          percentage *
              (endAngle - startAngle - (spacingCompensation * .8)) /
              100;
    }

    return pointerAngle;
  }

  @override
  bool shouldRepaint(SemiCircle oldDelegate) => true;
}
