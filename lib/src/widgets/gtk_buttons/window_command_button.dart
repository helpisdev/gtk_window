import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';

class WindowCommandButton extends StatelessWidget {
  const WindowCommandButton({
    required this.onPressed,
    required this.icon,
    required this.isFocused,
    this.semanticsLabel,
    this.tooltip,
    this.hoverColor,
    super.key,
  });

  static const double width = 28;
  static const double height = 28;

  final bool isFocused;
  final String? semanticsLabel;
  final String? tooltip;
  final Color? hoverColor;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(final BuildContext context) => Center(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: GTKColor.getGTKColor(
              context,
              type: GTKColorType.buttonBackground,
              isFocused: isFocused,
            ),
          ),
          child: IconButton(
            color: GTKColor.getGTKColor(
              context,
              type: GTKColorType.buttonIcon,
            ),
            hoverColor: hoverColor,
            icon: Icon(
              icon,
              semanticLabel: semanticsLabel,
              size: width * 5 / 8,
            ),
            iconSize: width * 3 / 4,
            tooltip: tooltip ?? semanticsLabel,
            padding: EdgeInsets.zero,
            onPressed: onPressed,
          ),
        ),
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('isFocused', isFocused))
      ..add(DiagnosticsProperty<VoidCallback>('onPressed', onPressed))
      ..add(DiagnosticsProperty<IconData>('icon', icon))
      ..add(StringProperty('semanticsLabel', semanticsLabel))
      ..add(ColorProperty('hoverColor', hoverColor))
      ..add(StringProperty('tooltip', tooltip));
  }
}
