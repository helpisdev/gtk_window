import 'package:adaptive_scaffold/adaptive_scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gtk_window/src/widgets/gtk_buttons/gtk_buttons.dart';
import 'package:universal_io/io.dart';

typedef OnWillPop = Future<bool> Function();

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
    this.onDrawerButtonPressed,
    this.onBackButtonPressed,
    this.onWillPop,
    this.drawerButtonStyle,
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
  final VoidCallback? onDrawerButtonPressed;
  final VoidCallback? onBackButtonPressed;
  final ButtonStyle? drawerButtonStyle;
  final OnWillPop? onWillPop;
  final ButtonStyle? backButtonStyle;
  final Color? backButtonColor;

  @override
  Widget build(final BuildContext context) {
    final bool canPop = ModalRoute.of(context)?.canPop ?? false;
    final bool hasDrawer = Scaffold.maybeOf(context)?.hasDrawer ?? false;
    final bool isSmall = PredefinedBreakpoint.smallAndDown.isActive(context);

    final bool macOS = Platform.isMacOS;
    final bool back = autoImplyLeading && canPop && !macOS;
    final bool drawer = hasDrawer && isSmall && !back && !macOS;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (macOS)
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
              if (back)
                WillPopScope(
                  onWillPop: onWillPop,
                  child: BackButton(
                    onPressed: onBackButtonPressed,
                    style: backButtonStyle,
                    color: backButtonColor,
                  ),
                ),
              if (drawer)
                DrawerButton(
                  onPressed: onDrawerButtonPressed,
                  style: drawerButtonStyle,
                ),
              ...leading,
            ],
          ),
        ),
      ],
    );
  }

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
        DiagnosticsProperty<ButtonStyle?>('backButtonStyle', backButtonStyle),
      )
      ..add(ColorProperty('backButtonColor', backButtonColor))
      ..add(
        DiagnosticsProperty<ButtonStyle?>(
          'drawerButtonStyle',
          drawerButtonStyle,
        ),
      )
      ..add(
        ObjectFlagProperty<VoidCallback?>.has(
          'onDrawerButtonPressed',
          onDrawerButtonPressed,
        ),
      )
      ..add(
        ObjectFlagProperty<VoidCallback?>.has(
          'onBackButtonPressed',
          onBackButtonPressed,
        ),
      )
      ..add(ObjectFlagProperty<OnWillPop?>.has('onWillPop', onWillPop));
  }
}
