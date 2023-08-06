import 'dart:async';

import 'package:context_menu/context_menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:utilities/utilities.dart';
import 'package:window_manager/window_manager.dart';

import '../colors.dart';
import '../manager.dart';
import 'gtk_buttons/window_command_button.dart';
import 'leading.dart';
import 'trailing.dart';

typedef WindowResizeCallback = void Function(Size size);

class GTKHeaderBar extends StatefulWidget implements PreferredSizeWidget {
  const GTKHeaderBar({
    super.key,
    this.trailing = const <Widget>[],
    this.leading = const <Widget>[],
    this.middle,
    this.bottom,
    this.height = WindowCommandButton.width * 2,
    this.middleSpacing = 10,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.showLeading = true,
    this.showTrailing = true,
    this.showMaximizeButton = true,
    this.showMinimizeButton = true,
    this.showCloseButton = true,
    this.showWindowControlsButtons = true,
    this.onWindowResize,
    this.autoImplyLeading = true,
    this.backButtonStyle,
    this.backButtonColor,
    this.onDrawerButtonPressed,
    this.onBackButtonPressed,
    this.onWillPop,
    this.drawerButtonStyle,
  });
  final List<Widget> leading;
  final List<Widget> trailing;
  final Widget? middle;
  final PreferredSizeWidget? bottom;
  final double height;
  final double middleSpacing;
  final EdgeInsetsGeometry padding;
  final bool autoImplyLeading;
  final bool showLeading;
  final bool showTrailing;
  final bool showMaximizeButton;
  final bool showMinimizeButton;
  final bool showCloseButton;
  final bool showWindowControlsButtons;
  final WindowResizeCallback? onWindowResize;
  final ButtonStyle? backButtonStyle;
  final Color? backButtonColor;
  final VoidCallback? onDrawerButtonPressed;
  final VoidCallback? onBackButtonPressed;
  final OnWillPop? onWillPop;
  final ButtonStyle? drawerButtonStyle;

  @override
  Size get preferredSize {
    final double macOSExtraSpace =
        Platform.isMacOS ? WindowCommandButton.width : 0;
    return Size.fromHeight(
      height + macOSExtraSpace + (bottom?.preferredSize.height ?? 0),
    );
  }

  @override
  State<GTKHeaderBar> createState() => _GTKHeaderBarState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<WindowResizeCallback?>(
          'onWindowResize',
          onWindowResize,
        ),
      )
      ..add(DoubleProperty('height', height))
      ..add(DoubleProperty('middleSpacing', middleSpacing))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding))
      ..add(DiagnosticsProperty<bool>('showLeading', showLeading))
      ..add(DiagnosticsProperty<bool>('showTrailing', showTrailing))
      ..add(
        DiagnosticsProperty<bool>('showMaximizeButton', showMaximizeButton),
      )
      ..add(
        DiagnosticsProperty<bool>('showMinimizeButton', showMinimizeButton),
      )
      ..add(DiagnosticsProperty<bool>('showCloseButton', showCloseButton))
      ..add(
        DiagnosticsProperty<bool>(
          'showWindowControlsButtons',
          showWindowControlsButtons,
        ),
      )
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

class _GTKHeaderBarState extends State<GTKHeaderBar> implements WindowListener {
  bool isFocused = true;
  bool isMaximized = false;
  bool isMinimized = false;
  bool isFullScreen = false;
  bool isAlwaysOnTop = false;

  Future<void> _closeFullScreen() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await windowManager.unmaximize();
    await windowManager.setAlwaysOnTop(false);
    setState(() {
      isAlwaysOnTop = false;
      isFullScreen = false;
    });
  }

  Future<void> _enterFullScreen() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    await windowManager.maximize();
    await windowManager.setAlwaysOnTop(true);
    setState(() {
      isAlwaysOnTop = true;
      isFullScreen = true;
    });
  }

  Future<void> _handleFullScreen(final HotKey key) async {
    if (isFullScreen) {
      await _closeFullScreen();
    } else {
      if (key == F) {
        await _enterFullScreen();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    unawaited(GTKManager.configureFullScreen(_handleFullScreen));
    windowManager.addListener(this);
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowEvent(final String eventName) {}

  @override
  void onWindowMoved() {}

  @override
  void onWindowMove() {}

  @override
  void onWindowResized() {}

  @override
  void onWindowDocked() {}

  @override
  void onWindowUndocked() {}

  @override
  Future<void> onWindowResize() async {
    widget.onWindowResize?.call(await windowManager.getSize());
  }

  @override
  void onWindowClose() {
    unawaited(windowManager.close());
  }

  @override
  void onWindowEnterFullScreen() {
    unawaited(windowManager.setFullScreen(true));
    setState(() => isFullScreen = true);
  }

  @override
  void onWindowLeaveFullScreen() {
    unawaited(windowManager.setFullScreen(false));
    setState(() => isFullScreen = false);
  }

  @override
  void onWindowMinimize() {
    unawaited(windowManager.minimize());
    setState(() => isMinimized = true);
  }

  @override
  void onWindowRestore() {
    unawaited(windowManager.restore());
    setState(() => isMinimized = false);
  }

  @override
  void onWindowFocus() {
    unawaited(windowManager.focus());
    setState(() => isFocused = true);
  }

  @override
  void onWindowBlur() {
    unawaited(windowManager.blur());
    setState(() => isFocused = false);
  }

  @override
  void onWindowMaximize() {
    unawaited(windowManager.maximize());
    setState(() => isMaximized = true);
  }

  @override
  void onWindowUnmaximize() {
    unawaited(windowManager.unmaximize());
    setState(() => isMaximized = false);
  }

  @override
  Widget build(final BuildContext context) {
    final Color background = GTKColor.getGTKColor(
      context,
      type: GTKColorType.buttonBackground,
      isFocused: false,
    );
    return Visibility(
      visible: !isFullScreen,
      child: ContextMenuArea(
        background: background,
        items: <Widget>[
          // Do not remove this -- it updates the state of the context menu.
          StatefulBuilder(
            builder: (
              final BuildContext context,
              final StateSetter setState,
            ) =>
                ListTile(
              tileColor: background,
              hoverColor: GTKColor.getGTKColor(
                context,
                type: GTKColorType.buttonBackground,
                isFocused: true,
              ),
              textColor: GTKColor.getGTKColor(
                context,
                type: GTKColorType.buttonIcon,
              ),
              leading: Visibility(
                visible: isAlwaysOnTop,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: GTKColor.getGTKColor(
                    context,
                    type: GTKColorType.buttonIcon,
                  ),
                ),
              ),
              // TODO(helpisdev): Add this to localization files
              title: const LabelLarge('Always on top'),
              onTap: () async {
                await windowManager.setAlwaysOnTop(!isAlwaysOnTop);
                setState(() {
                  isAlwaysOnTop = !isAlwaysOnTop;
                });
              },
            ),
          ),
        ],
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: widget.preferredSize.height,
                  ),
                  decoration: _getBoxDecoration(context),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onDoubleTap: onDoubleTap,
                    onPanStart: onPanStart,
                    child: Padding(
                      padding: widget.padding,
                      child: NavigationToolbar(
                        middle: widget.middle,
                        middleSpacing: widget.middleSpacing,
                        leading: GTKHeaderBarLeadingWidget(
                          leading: widget.leading,
                          showButtons: widget.showWindowControlsButtons,
                          showMinimize: widget.showMinimizeButton,
                          showMaximize: widget.showMaximizeButton,
                          showClose: widget.showCloseButton,
                          resizeOnPressed: _resize,
                          isFocused: isFocused,
                          isMaximized: isMaximized,
                          onDrawerButtonPressed: widget.onDrawerButtonPressed,
                          onWillPop: widget.onWillPop,
                          onBackButtonPressed: widget.onBackButtonPressed,
                          drawerButtonStyle: widget.drawerButtonStyle,
                          backButtonColor: widget.backButtonColor,
                          backButtonStyle: widget.backButtonStyle,
                          autoImplyLeading: widget.autoImplyLeading,
                        ),
                        trailing: GTKHeaderBarTrailingWidget(
                          trailing: widget.trailing,
                          showButtons: widget.showWindowControlsButtons,
                          showMinimize: widget.showMinimizeButton,
                          showMaximize: widget.showMaximizeButton,
                          showClose: widget.showCloseButton,
                          resizeOnPressed: _resize,
                          isFocused: isFocused,
                          isMaximized: isMaximized,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              widget.bottom ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _getBoxDecoration(final BuildContext context) => BoxDecoration(
        color: GTKColor.getGTKColor(
          context,
          type: GTKColorType.background,
          isFocused: isFocused,
        ),
        border: Border(
          bottom: BorderSide(
            color: GTKColor.getGTKColor(context, type: GTKColorType.border),
          ),
        ),
      );

  Future<void> onPanStart(final DragStartDetails details) async =>
      windowManager.startDragging();

  Future<void> onDoubleTap() async => _resize();

  Future<void> _resize() async => isMaximized
      ? await windowManager.unmaximize()
      : await windowManager.maximize();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('isFocused', isFocused))
      ..add(DiagnosticsProperty<bool>('isMaximized', isMaximized))
      ..add(DiagnosticsProperty<bool>('isFullScreen', isFullScreen))
      ..add(DiagnosticsProperty<bool>('isMinimized', isMinimized))
      ..add(DiagnosticsProperty<bool>('isAlwaysOnTop', isAlwaysOnTop));
  }
}
