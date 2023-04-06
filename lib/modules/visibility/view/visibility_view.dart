import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:weather_android_app/modules/home/presenter/home_presenter.dart';
import 'package:weather_android_app/modules/visibility/view/widgets/main_content.dart';

class VisibilityView extends StatefulWidget {
  const VisibilityView(
    this.presenter, {
    Key? key,
  }) : super(key: key);

  final HomePresenter presenter;

  @override
  State<VisibilityView> createState() => _VisibilityViewState();
}

class _VisibilityViewState extends State<VisibilityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: animate(
        100,
        MainContent(
          presenter: widget.presenter,
        ),
      ),
    );
  }

  Widget animate(int delay, Widget child) {
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }
}
