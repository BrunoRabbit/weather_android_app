import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_android_app/modules/visibility/entity/weather_entity.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view_model.dart';

import 'entity/weather_entity_test.mocks.dart';

void main() {
  group("visibility_view_model_test", () {
    group('Test cases for changeIndex method', () {
      late VisibilityViewModel viewModel;

      setUp(() {
        viewModel = VisibilityViewModel();
      });

      test('Should change currentIndex value to 0', () {
        when((_) => viewModel.changeIndex(0), () => 0);

        expect(viewModel.currentIndex, equals(0));
      });
      test('Should change currentIndex value to 1', () {
        when((_) => viewModel.changeIndex(1), () => 1);

        expect(viewModel.currentIndex, equals(1));
      });
      test('Should change currentIndex value to 2', () {
        when((_) => viewModel.changeIndex(2), () => 2);

        expect(viewModel.currentIndex, equals(2));
      });
    });

    group('Test case for VisibilityViewModel currentIndex', () {
      late VisibilityViewModel viewModel;

      setUp(() {
        viewModel = VisibilityViewModel();
      });

      test('Test if currentIndex is 0', () {
        viewModel.currentIndex = 0;

        expect(viewModel.currentIndex, equals(0));
      });
      test('Test if currentIndex is 1', () {
        viewModel.currentIndex = 1;

        expect(viewModel.currentIndex, equals(1));
      });
      test('Test if currentIndex is 2', () {
        viewModel.currentIndex = 2;

        expect(viewModel.currentIndex, equals(2));
      });
    });

    group('addItemHistory method', () {
      late VisibilityViewModel viewModel;
      late WeatherEntity mockWeatherEntity;

      setUp(() {
        viewModel = VisibilityViewModel();
        mockWeatherEntity = MockWeatherEntity();
      });

      test('is list history populated at index 0', () {
        const currentIndex = 0;
        viewModel.addItemHistory(mockWeatherEntity, currentIndex);

        expect(viewModel.history[currentIndex], [mockWeatherEntity]);
      });
      test('is list history populated at index 1', () {
        const currentIndex = 1;
        viewModel.addItemHistory(mockWeatherEntity, currentIndex);

        expect(viewModel.history[currentIndex], [mockWeatherEntity]);
      });

      test('should add new item to history if it does not exist', () {
        viewModel.addItemHistory(mockWeatherEntity, 0);

        expect(viewModel.history[0], contains(mockWeatherEntity));
      });
      test('should not add new item to history if it already exists', () {
        final mockWeatherEntity2 = MockWeatherEntity();

        viewModel.addItemHistory(mockWeatherEntity, 0);

        viewModel.addItemHistory(mockWeatherEntity2, 0);

        expect(viewModel.history[0].length, 1);
      });

      test('is list history is greater than 10, remove the first index', () {
        final weatherList = List.generate(
          11,
          (index) => WeatherEntity(
            dateTime: '10/10/2000',
            icon: Icons.abc,
            visibility: index + 1.0,
          ),
        );

        for (var i = 0; i < 11; i++) {
          viewModel.addItemHistory(weatherList[i], 0);
        }
        expect(viewModel.history[0].length, equals(10));
        expect(viewModel.history[0], isNot(contains(mockWeatherEntity)));
      });

      test('when method is called [date] is not empty', () {
        const currentIndex = 0;
        viewModel.addItemHistory(mockWeatherEntity, currentIndex);

        expect(viewModel.date, mockWeatherEntity.dateTime);
      });
    });

    test('[date] is empty', () {
      VisibilityViewModel viewModel = VisibilityViewModel();

      expect(viewModel.date, isEmpty);
    });
  });
}
