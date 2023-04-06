import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:weather_android_app/modules/home/presenter/home_presenter.dart';
import 'package:weather_android_app/utility/text_utility.dart';

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final HomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () {},
                ),
              ],
            ),
            Observer(
              builder: (context) {
                return presenter.userLocation != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8),
                        child: Text(
                          _dateFormat(presenter.userLocation!.results!.date!),
                          style: TextUtility.headline3.copyWith(
                            color: Colors.grey,
                            fontFamily: 'Nunito-SemiBold',
                          ),
                        ),
                      )
                    : Container();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Visibilidade',
                    style: TextUtility.headline2.copyWith(
                      color: Colors.black87,
                      fontFamily: 'Nunito-Bold',
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 140,
              child: CustomPaint(
                painter: SemiCircle(percentage: 100),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      '100%',
                      style: TextUtility.headline1.medium.copyWith(
                        color: Colors.black87,
                        fontFamily: 'Nunito-SemiBold',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _dateFormat(String date) {
    final inputFormat = DateFormat("dd/MM/yyyy");
    final inputDate = inputFormat.parse(date);
    final outputFormat = DateFormat("E, dd 'de' MMMM", 'pt_BR');
    return outputFormat.format(inputDate);
  }
}

// ! There are 2 semi-circles, I'll call them `sc`, scA(grey) and scB(purple), superimpose scB over scA respecting its spacing
// ? I thought the code is a bit complex so I thought I need to explain for the near future
class SemiCircle extends CustomPainter {
  double percentage;

  SemiCircle({
    required this.percentage,
  });

  final double semiArcSize = 140;
  final double startAngle = math.pi - 0.3;
  final double endAngle = 2 * math.pi;
  final double spacing = .15;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;

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
      pointerAngle = .24 +
          startAngle +
          percentage *
              (endAngle - startAngle - (spacingCompensation * .8)) /
              100;
    }
    if (percentage > 75) {
      pointerAngle = .366 +
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
