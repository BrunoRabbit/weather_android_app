import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_android_app/modules/home/presenter/home_presenter.dart';
import 'package:intl/intl.dart';
import 'package:weather_android_app/utility/text_utility.dart';

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
        SafeArea(
          child: Column(
            children: [
              Observer(
                builder: (context) => widget.presenter.userLocation != null
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Stack(
                          children: [
                            Text(
                              dateFormat(widget
                                  .presenter.userLocation!.results!.date!),
                              style: TextUtility.headline3.copyWith(
                                color: Colors.grey,
                                fontFamily: 'Nunito-Bold',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                    ),
                                    child: Text(
                                      'Voltar',
                                      style: TextUtility.body1.copyWith(
                                        fontFamily: 'Nunito-SemiBold',
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 36.0),
                              child: Text(
                                'Visibilidade',
                                style: TextUtility.headline2.copyWith(
                                  color: Colors.black87,
                                  fontFamily: 'Nunito-Bold',
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget animate(int delay, Widget child) {
    return FadeInUp(delay: Duration(milliseconds: delay), child: child);
  }

  String dateFormat(String date) {
    final inputFormat = DateFormat("dd/MM/yyyy");
    final inputDate = inputFormat.parse(date);
    final outputFormat = DateFormat("E, dd 'de' MMMM", 'pt_BR');
    return outputFormat.format(inputDate);
  }
}
