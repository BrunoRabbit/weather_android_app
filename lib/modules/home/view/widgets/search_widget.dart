// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/components/transparent_app_bar.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget(
    this.homeViewModel, {
    Key? key,
  }) : super(key: key);

  final HomeViewModel homeViewModel;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.homeViewModel.isFocused = false;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Observer(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    border: Border.all(
                      color: widget.homeViewModel.isFocused
                          ? Colors.purple
                          : Colors.grey,
                      width: 1.2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextFormField(
                            focusNode: _focusNode,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            onTap: () {
                              if(!widget.homeViewModel.isFocused){
                                widget.homeViewModel.buttonPressed();
                              }
                            },
                            onTapOutside: (event) {
                              if (widget.homeViewModel.isFocused = true) {
                                widget.homeViewModel.buttonPressed();
                                if (_focusNode.hasFocus) {
                                  _focusNode.unfocus();
                                }
                              }
                            },
                          ),
                        ),
                      ),
                      Hero(
                        tag: 'btn1',
                        child: Material(
                          shape: const CircleBorder(),
                          child: InkWell(
                            onTap: () {
                              print('DO');
                            },
                            customBorder: const CircleBorder(),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: widget.homeViewModel.isFocused
                                    ? Colors.purple
                                    : Colors.grey,
                              ),
                              child: Icon(
                                Icons.search,
                                color: widget.homeViewModel.isFocused
                                    ? Colors.white
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
