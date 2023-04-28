import 'package:flutter/material.dart';
import 'package:weather_android_app/modules/search/view/search_view_model.dart';
import 'package:weather_android_app/modules/search/view/widgets/autocomplete_style.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class AutocompleteWidget extends StatefulWidget {
  const AutocompleteWidget({
    Key? key,
    required this.states,
    required this.formKey,
    required this.viewModel,
  }) : super(key: key);

  final List<String> states;
  final GlobalKey<FormState> formKey;
  final SearchViewModel viewModel;

  @override
  State<AutocompleteWidget> createState() => _AutocompleteWidgetState();
}

class _AutocompleteWidgetState extends State<AutocompleteWidget> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Autocomplete<String>(
          optionsBuilder: (textEditingValue) {
            return widget.states.where(
              (String el) => el.contains(
                textEditingValue.text,
              ),
            );
          },
          optionsViewBuilder: (context, onSelected, options) {
            // ? Autocomplete style
            return AutocompleteStyle(
              onSelected: onSelected,
              options: options,
            );
          },
          fieldViewBuilder: (context, controller, focusNode, __) {
            // ? TextForm Style
            return Form(
              key: widget.formKey,
              child: TextFormField(
                controller: controller,
                focusNode: focusNode,
                decoration: InputDecoration(
                  hintText: 'Pesquisar',
                  hintStyle: TextUtility.body2.copyWith(
                    fontFamily: 'Nunito-Medium',
                    color: Colors.black54,
                  ),
                  border: InputBorder.none,
                  errorStyle: TextUtility.error1,
                ),
                validator: (value) {
                    widget.viewModel.searchController = controller;
                  if (value!.isEmpty) {
                    widget.viewModel.errorTxt = 'Esse campo não pode ser vazio';
                  } else {
                    widget.viewModel.errorTxt = '';
                  }
                  return null;
                },
                onTap: () {
                  if (!widget.viewModel.isFocused) {
                    widget.viewModel.buttonPressed();
                  }
                },
                onTapOutside: (event) {
                  if (widget.viewModel.isFocused = true) {
                    widget.viewModel.buttonPressed();
                    if (focusNode.hasFocus) {
                      focusNode.unfocus();
                    }
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
