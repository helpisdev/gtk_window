import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

import 'gtk_buttons/gtk_buttons.dart';

class GTKHeaderBarTrailingWidget extends StatelessWidget {
  const GTKHeaderBarTrailingWidget({
    required this.leading,
    required this.trailing,
    required this.resizeOnPressed,
    required this.isFocused,
    required this.isMaximized,
    required this.showButtons,
    required this.showClose,
    required this.showMaximize,
    required this.showMinimize,
    super.key,
  });

  final List<Widget> leading;
  final List<Widget> trailing;
  final VoidCallback resizeOnPressed;
  final bool isFocused;
  final bool isMaximized;
  final bool showButtons;
  final bool showClose;
  final bool showMaximize;
  final bool showMinimize;

  @override
  Widget build(final BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ...trailing,
          if (!Platform.isMacOS)
            Flexible(
              child: GTKButtons(
                isFocused: isFocused,
                showButtons: showButtons,
                showMinimize: showMinimize,
                showMaximize: showMaximize,
                resizeOnPressed: resizeOnPressed,
                isMaximized: isMaximized,
                showClose: showClose,
              ),
            ),
        ],
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('isFocused', isFocused))
      ..add(DiagnosticsProperty<bool>('showButtons', showButtons))
      ..add(DiagnosticsProperty<bool>('showMinimize', showMinimize))
      ..add(DiagnosticsProperty<bool>('showMaximize', showMaximize))
      ..add(DiagnosticsProperty<bool>('showClose', showClose))
      ..add(
        ObjectFlagProperty<VoidCallback>.has(
          'resizeOnPressed',
          resizeOnPressed,
        ),
      )
      ..add(DiagnosticsProperty<bool>('isMaximized', isMaximized));
  }
}
