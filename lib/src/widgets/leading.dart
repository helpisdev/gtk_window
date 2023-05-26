import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gtk_window/src/widgets/gtk_buttons/gtk_buttons.dart';
import 'package:universal_io/io.dart';

class GTKHeaderBarLeadingWidget extends StatelessWidget {
  const GTKHeaderBarLeadingWidget({
    required this.leading,
    required this.resizeOnPressed,
    required this.isFocused,
    required this.isMaximized,
    required this.showButtons,
    required this.showClose,
    required this.showMaximize,
    required this.showMinimize,
    this.autoImplyLeading = true,
    this.onWillPopCallback,
    this.backButtonStyle,
    this.backButtonColor,
    super.key,
  });

  final List<Widget> leading;
  final VoidCallback resizeOnPressed;
  final bool isFocused;
  final bool isMaximized;
  final bool showButtons;
  final bool showClose;
  final bool showMaximize;
  final bool showMinimize;
  final bool autoImplyLeading;
  final VoidCallback? onWillPopCallback;
  final ButtonStyle? backButtonStyle;
  final Color? backButtonColor;

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (Platform.isMacOS)
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
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (autoImplyLeading &&
                    (ModalRoute.of(context)?.canPop ?? false))
                  BackButton(
                    onPressed: onWillPopCallback,
                    style: backButtonStyle,
                    color: backButtonColor,
                  ),
                ...leading,
              ],
            ),
          ),
        ],
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        ObjectFlagProperty<VoidCallback>.has(
          'resizeOnPressed',
          resizeOnPressed,
        ),
      )
      ..add(DiagnosticsProperty<bool>('isFocused', isFocused))
      ..add(DiagnosticsProperty<bool>('isMaximized', isMaximized))
      ..add(DiagnosticsProperty<bool>('showButtons', showButtons))
      ..add(DiagnosticsProperty<bool>('showClose', showClose))
      ..add(DiagnosticsProperty<bool>('showMaximize', showMaximize))
      ..add(DiagnosticsProperty<bool>('showMinimize', showMinimize))
      ..add(DiagnosticsProperty<bool>('autoImplyLeading', autoImplyLeading))
      ..add(
        ObjectFlagProperty<VoidCallback?>.has(
          'onWillPopCallback',
          onWillPopCallback,
        ),
      )
      ..add(
        DiagnosticsProperty<ButtonStyle?>('backButtonStyle', backButtonStyle),
      )
      ..add(ColorProperty('backButtonColor', backButtonColor));
  }
}
