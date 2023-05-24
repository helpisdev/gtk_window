import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide CloseButton;
import 'package:universal_io/io.dart';

import 'close.dart';
import 'minimize.dart';
import 'resize.dart';
import 'window_command_button.dart';

export 'close.dart';
export 'minimize.dart';
export 'resize.dart';
export 'window_command_button.dart';

class GTKButtons extends StatelessWidget {
  const GTKButtons({
    required this.isFocused,
    required this.showButtons,
    required this.showMinimize,
    required this.showMaximize,
    required this.resizeOnPressed,
    required this.isMaximized,
    required this.showClose,
    super.key,
  });

  final bool isFocused;
  final bool showButtons;
  final bool showMinimize;
  final bool showMaximize;
  final VoidCallback resizeOnPressed;
  final bool isMaximized;
  final bool showClose;

  double _calcGTKButtonsWidth() {
    int visibleButtons = 0;
    if (showButtons) {
      if (showClose) {
        visibleButtons++;
      }
      if (showMaximize) {
        visibleButtons++;
      }
      if (showMinimize) {
        visibleButtons++;
      }
    }
    return visibleButtons * WindowCommandButton.width +
        ((visibleButtons - 1) * WindowCommandButton.width / 2);
  }

  List<Widget> get _buttons {
    final List<Widget> children = <Widget>[
      MinimizeButton(
        isFocused: isFocused,
        visible: showButtons && showMinimize,
      ),
      const Spacer(),
      ResizeButton(
        visible: showButtons && showMaximize,
        onPressed: resizeOnPressed,
        isMaximized: isMaximized,
        isFocused: isFocused,
      ),
      const Spacer(),
      CloseButton(
        isFocused: isFocused,
        visible: showButtons && showClose,
      ),
    ];
    if (Platform.isMacOS) {
      return children.reversed.toList();
    }
    return children;
  }

  @override
  Widget build(final BuildContext context) => ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: WindowCommandButton.height,
          maxWidth: _calcGTKButtonsWidth(),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: _buttons),
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('isFocused', isFocused))
      ..add(DiagnosticsProperty<bool>('showButtons', showButtons))
      ..add(DiagnosticsProperty<bool>('showMinimize', showMinimize))
      ..add(DiagnosticsProperty<bool>('showMaximize', showMaximize))
      ..add(
        ObjectFlagProperty<VoidCallback>.has(
          'resizeOnPressed',
          resizeOnPressed,
        ),
      )
      ..add(DiagnosticsProperty<bool>('isMaximized', isMaximized))
      ..add(DiagnosticsProperty<bool>('showClose', showClose));
  }
}
