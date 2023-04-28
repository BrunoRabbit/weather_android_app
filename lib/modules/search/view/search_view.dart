import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/components/transparent_app_bar.dart';
import 'package:weather_android_app/modules/search/presenter/search_presenter.dart';
import 'package:weather_android_app/modules/search/view/search_view_model.dart';
import 'package:weather_android_app/modules/search/view/widgets/autocomplete_widget.dart';
import 'package:weather_android_app/utils/utility/app_utility.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class SearchView extends StatefulWidget {
  const SearchView(
    this.searchViewModel,
    this.presenter, {
    Key? key,
  }) : super(key: key);

  final SearchViewModel searchViewModel;
  final SearchPresenter presenter;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String errorText = '';

  @override
  void initState() {
    super.initState();
    widget.searchViewModel.isFocused = false;
    widget.searchViewModel.errorTxt = errorText;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final viewModel = widget.searchViewModel;
        final states = viewModel.statesHistory;

        return Scaffold(
          appBar: TransparentAppBar(
            title: const AppText(
              'Procure uma cidade',
              color: Colors.black87,
              size: 20,
            ),
            isActionEnabled: false,
            leading: SizedBox(
              width: 14,
              child: IconButton(
                onPressed: () {
                  if (!viewModel.isLoading) {
                    Navigator.of(context).pop();
                  }
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          body: !viewModel.isLoading
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ? Border
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(
                            color: viewModel.errorTxt!.isNotEmpty
                                ? AppUtility.kErrorColor
                                : viewModel.isFocused
                                    ? Colors.purple
                                    : Colors.grey,
                            width: 1.2,
                          ),
                        ),
                        child: Row(
                          children: [
                            // ? Autocomplete(inside this widget has TextForm)
                            AutocompleteWidget(
                              formKey: _formKey,
                              states: states,
                              viewModel: widget.searchViewModel,
                            ),

                            // ? Button + Hero Animation
                            Hero(
                              tag: 'btn1',
                              child: Material(
                                shape: const CircleBorder(),
                                child: InkWell(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await widget.presenter
                                          .searchCity(context);
                                    }
                                  },
                                  customBorder: const CircleBorder(),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: viewModel.errorTxt!.isNotEmpty
                                          ? AppUtility.kErrorColor
                                          : viewModel.isFocused
                                              ? Colors.purple
                                              : Colors.grey,
                                    ),
                                    child: const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    viewModel.errorTxt!.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: AppText(
                              viewModel.errorTxt!,
                              style: TextUtility.error1.copyWith(
                                fontFamily: 'SemiBold',
                              ),
                            ),
                          )
                        : Container(),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
