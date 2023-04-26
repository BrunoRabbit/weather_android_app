import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransparentAppBar extends AppBar {
  TransparentAppBar({
    required Widget title,
    required bool isActionEnabled,
    VoidCallback? onPressed,
    Widget? leading,
    super.key,
  }) : super(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: title,
          leading: leading,
          actions: [
            isActionEnabled
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                      ),
                      onPressed: onPressed,
                    ),
                  )
                : Container(),
          ],
        );

  factory TransparentAppBar.withTitleObserver({
    Key? key,
    required Widget Function(BuildContext) titleBuilder,
    bool isActionEnabled = false,
    VoidCallback? onPressed,
  }) {
    return TransparentAppBar(
      key: key,
      isActionEnabled: isActionEnabled,
      title: Observer(builder: titleBuilder),
      onPressed: onPressed,
    );
  }
}
