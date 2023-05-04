// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'search_view_model.g.dart';

class SearchViewModel = _SearchViewModel with _$SearchViewModel;

abstract class _SearchViewModel with Store {
  @observable
  List<String> statesHistory = [];

  @observable
  String? errorTxt = '';

  @observable
  TextEditingController searchController = TextEditingController();

  @observable
  bool isLoading = false;
  
  @observable
  bool isFocused = false;

  @action
  buttonPressed() async {
    isFocused = !isFocused;
  }
}