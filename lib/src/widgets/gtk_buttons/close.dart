import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'window_command_button.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({
    required this.isFocused,
    required this.visible,
    super.key,
  });

  final bool isFocused;
  final bool visible;

  @override
  Widget build(final BuildContext context) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(
      context,
    );
    return Flexible(
      flex: 2,
      child: Visibility(
        visible: visible,
        child: WindowCommandButton(
          onPressed: windowManager.close,
          icon: Icons.close_rounded,
          semanticsLabel: localizations.closeButtonLabel,
          tooltip: localizations.closeButtonTooltip,
          isFocused: isFocused,
          hoverColor: const Color.fromRGBO(255, 96, 92, 80),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('isFocused', isFocused))
      ..add(DiagnosticsProperty<bool>('visible', visible));
  }
}
