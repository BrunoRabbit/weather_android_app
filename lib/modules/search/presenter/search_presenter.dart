import 'package:flutter/material.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/search/interactor/search_interactor.dart';
import 'package:weather_android_app/modules/search/view/search_view_model.dart';

class SearchPresenter {
  SearchPresenter(this.viewModel, this.homeViewModel);

  SearchViewModel viewModel;
  HomeViewModel homeViewModel;

  SearchInteractor interactor = SearchInteractor();

  Future<void> getCityData(String name) async {
    homeViewModel.userLocation = await interactor.fetchCityData(name);
  }

  Future<void> searchCity(BuildContext context) async {
    if (viewModel.searchController.text.isNotEmpty) {
      viewModel.isLoading = true;
      await getCityData(viewModel.searchController.text).whenComplete(() {
        viewModel.statesHistory.add(viewModel.searchController.text);
        viewModel.isLoading = false;
        Navigator.of(context).pop();
      });
    }
  }
}
