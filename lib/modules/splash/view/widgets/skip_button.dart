import 'package:flutter/material.dart';
import 'package:weather_android_app/utility/app_utility.dart';
import 'package:weather_android_app/utility/text_utility.dart';

class SkipButton extends StatefulWidget {
  const SkipButton({
    Key? key,
    required this.size,
    required this.pageController,
  }) : super(key: key);

  final Size size;
  final PageController pageController;

  @override
  State<SkipButton> createState() => _SkipButtonState();
}

class _SkipButtonState extends State<SkipButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      splashColor: AppUtility.secondaryColor,
      onTap: () {
        setState(() {
          widget.pageController.animateToPage(
            2,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastOutSlowIn,
          );
        });
      },
      child: Container(
        width: widget.size.width / 1.5,
        height: widget.size.height / 13,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppUtility.secondaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Text(
            "Pular",
            style: TextUtility.headline3,
          ),
        ),
      ),
    );
  }
}
