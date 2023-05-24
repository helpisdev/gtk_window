import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import '../../gen/app_localizations.dart';
import 'window_command_button.dart';

class MinimizeButton extends StatelessWidget {
  const MinimizeButton({
    required this.isFocused,
    required this.visible,
    super.key,
  });

  final bool isFocused;
  final bool visible;

  @override
  Widget build(final BuildContext context) {
    final GTKLocalizations localizations = GTKLocalizations.of(context);
    return Flexible(
      flex: 2,
      child: Visibility(
        visible: visible,
        child: WindowCommandButton(
          onPressed: windowManager.minimize,
          icon: Icons.minimize_rounded,
          semanticsLabel: localizations.minimize,
          isFocused: isFocused,
          hoverColor: const Color.fromRGBO(0, 202, 78, 80),
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
