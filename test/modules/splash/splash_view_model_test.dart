import 'package:flutter_test/flutter_test.dart';
import 'package:weather_android_app/modules/splash/view/splash_view_model.dart';

void main() {
  group('SplashViewModel', () {
    group('currentIndex', () {
      test('verify if currentIndex is 0', () {
        //Arrange
        SplashViewModel viewModel = SplashViewModel();

        // act
        viewModel.currentIndex = 0;

        //Assert
        expect(viewModel.currentIndex, equals(0));
      });
      test('verify if currentIndex is 1', () {
        //Arrange
        SplashViewModel viewModel = SplashViewModel();

        //Act
        viewModel.currentIndex = 1;

        //Assert
        expect(viewModel.currentIndex, equals(1));
      });
      test('verify if currentIndex is 2', () {
        //Arrange
        SplashViewModel viewModel = SplashViewModel();

        //Act
        viewModel.currentIndex = 2;

        //Assert
        expect(viewModel.currentIndex, equals(2));
      });
    });

    group('onPageChanged', () {
      test('when method is called, change the currentIndex to 0', () async {
        //Arrange
        SplashViewModel viewModel = SplashViewModel();

        //Act
        viewModel.onPageChanged(0);

        //Assert
        expect(viewModel.currentIndex, equals(0));
      });
      test('when method is called, change the currentIndex to 1', () async {
        //Arrange
        SplashViewModel viewModel = SplashViewModel();

        //Act
        viewModel.onPageChanged(1);

        //Assert
        expect(viewModel.currentIndex, equals(1));
      });
      test('when method is called, change the currentIndex to 2', () async {
        //Arrange
        SplashViewModel viewModel = SplashViewModel();

        //Act
        viewModel.onPageChanged(2);

        //Assert
        expect(viewModel.currentIndex, equals(2));
      });
    });

  });
}
