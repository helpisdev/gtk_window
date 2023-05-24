import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../gen/app_localizations.dart';
import 'window_command_button.dart';

class ResizeButton extends StatelessWidget {
  const ResizeButton({
    required this.onPressed,
    required this.isMaximized,
    required this.isFocused,
    required this.visible,
    super.key,
  });

  final bool isFocused;
  final bool visible;
  final VoidCallback onPressed;
  final bool isMaximized;

  @override
  Widget build(final BuildContext context) {
    final GTKLocalizations localizations = GTKLocalizations.of(context);
    return Flexible(
      flex: 2,
      child: Visibility(
        visible: visible,
        child: WindowCommandButton(
          onPressed: onPressed,
          icon: isMaximized
              ? Icons.close_fullscreen_rounded
              : Icons.open_in_full_rounded,
          semanticsLabel:
              isMaximized ? localizations.unmaximize : localizations.maximize,
          isFocused: isFocused,
          hoverColor: const Color.fromRGBO(255, 189, 68, 80),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<VoidCallback>.has('onPressed', onPressed))
      ..add(DiagnosticsProperty<bool>('isMaximized', isMaximized))
      ..add(DiagnosticsProperty<bool>('isFocused', isFocused))
      ..add(DiagnosticsProperty<bool>('visible', visible));
  }
}
