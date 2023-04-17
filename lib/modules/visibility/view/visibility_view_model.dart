import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_android_app/modules/visibility/entity/weather_entity.dart';

part 'visibility_view_model.g.dart';

class VisibilityViewModel = _VisibilityViewModel with _$VisibilityViewModel;

abstract class _VisibilityViewModel with Store {
  // * tell the UI to render it
  _VisibilityViewModel() {
    autorun((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {});
    });
  }

  @observable
  List<List<WeatherEntity>> history = ObservableList<List<WeatherEntity>>.of(
    List.generate(
      7,
      (_) => [],
    ),
  );

  @observable
  int currentIndex = 0;

  @observable
  String date = '';

  @action
  changeIndex(int newIndex) {
    currentIndex = newIndex;
  }

  @action
  void addItemHistory(WeatherEntity newItem, int index) {
    bool itemExists = history[currentIndex].any(
      (item) => (item.visibility == newItem.visibility),
    );
    
    if (!itemExists) {
      date = newItem.dateTime;
      history[index].add(newItem);

      if (history[currentIndex].length > 10) {
        history[currentIndex].removeAt(0);
      }
    }
  }
}
