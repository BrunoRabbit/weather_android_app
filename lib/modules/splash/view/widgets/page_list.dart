import 'package:flutter/material.dart';
import 'package:weather_android_app/modules/splash/entity/page_item.dart';
import 'package:weather_android_app/utility/text_utility.dart';

class PageList {
  late List<PageItem> list;

  PageList.init() {
    list = [
      PageItem(
        img: "assets/images/weather_bro.svg",
        title: "Seja bem-vindo",
        subTitle: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Weather App\n",
                style: TextUtility.headline1,
                children: [
                  TextSpan(
                    text: "Sua solução alternativa para ver o clima",
                    style: TextUtility.body1.italic,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      PageItem(
        img: "assets/images/weather_chart.svg",
        title: "Seus dados estão seguros",
        subTitle: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Como seu dado é utilizado?\n",
                style: TextUtility.headline2,
                children: [
                  TextSpan(
                    text:
                        "Utilizamos seus dados apenas para armazenar seu histórico",
                    style: TextUtility.body1.italic,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      PageItem(
        img: "assets/images/raining_woman.svg",
        title: "Facil de usar",
        subTitle: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Detalhes do clima\n",
                style: TextUtility.headline1,
                children: [
                  TextSpan(
                    text: "Veja dados precisos com apenas um clique",
                    style: TextUtility.body1.italic,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
