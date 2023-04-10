import 'package:flutter/material.dart';
import 'package:weather_android_app/modules/splash/entity/page_item.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

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
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                "Weather App",
                textAlign: TextAlign.center,
                style: TextUtility.headline1,
              ),
            ),
            Text(
              "Sua solução alternativa para ver o clima",
              style:
                  TextUtility.body1.italic.copyWith(fontFamily: 'Nunito-Bold'),
              textAlign: TextAlign.center,
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
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                "Como seus dados são utilizados?",
                textAlign: TextAlign.center,
                style: TextUtility.headline3,
              ),
            ),
            Text(
              "Utilizamos seus dados apenas para armazenar seu histórico",
              style:
                  TextUtility.body1.italic.copyWith(fontFamily: 'Nunito-Bold'),
              textAlign: TextAlign.center,
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
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                "Detalhes do clima",
                textAlign: TextAlign.center,
                style: TextUtility.headline1,
              ),
            ),
            Text(
             "Veja dados precisos com apenas um clique",
              style:
                  TextUtility.body1.italic.copyWith(fontFamily: 'Nunito-Bold'),
              textAlign: TextAlign.center,
            ),
            
          ],
        ),
      ),
    ];
  }
}
