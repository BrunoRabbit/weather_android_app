import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:weather_android_app/modules/visibility/entity/weather_entity.dart';

@GenerateNiceMocks([
  MockSpec<WeatherEntity>(),
])
void main() {
  group('WeatherEntity', () {
    test('when weather entity create tree new itens with createNewItem method',
        () {
      const weatherIcon = Icons.abc;
      final dateTimeNow = DateTime.now();
      const dateTime = '10/10/2000';

      final weather = List.generate(
        3,
        (index) => WeatherEntity.createNewItem(
          weatherIcon,
          index + 1.0,
          dateTime,
          dateTimeNow,
        ),
      );

      expect(weather.length, 3);

      for (var i = 0; i < weather.length; i++) {
        for (var j = i + 1; j < weather.length; j++) {
          expect(weather[i], isNot(same(weather[j])));
        }
      }
    });
    test('when weather entities have same values they shouldn\'t be equal', () {
      const weatherIcon = Icons.abc;
      final dateTimeNow = DateTime.now();
      const dateTime = '10/10/2000';

      final weather1 = WeatherEntity.createNewItem(
        weatherIcon,
        1.0,
        dateTime,
        dateTimeNow,
      );
      final weather2 = WeatherEntity.createNewItem(
        weatherIcon,
        1.0,
        dateTime,
        dateTimeNow,
      );

      expect(weather1 == weather2, isFalse);
    });
  });
}
