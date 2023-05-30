// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef WindowResizeCallback = void Function(Size size);
typedef HotKeyHandler = void Function(HotKey hotKey);

class GTKManager {
  static void ensureInitialized() {}
  static Future<void> configureFullScreen(final HotKeyHandler listener) async {}
}

enum HotKeyScope {
  _,
}

enum KeyCode {
  _,
}

enum KeyModifier {
  // ignore: unused_field
  _,
}

class HotKey {
  HotKey(
    this.keyCode, {
    this.modifiers,
    // ignore: avoid_unused_constructor_parameters
    final String? identifier,
    // ignore: avoid_unused_constructor_parameters
    final HotKeyScope? scope,
  });

  // ignore: avoid_unused_constructor_parameters
  factory HotKey.fromJson(final Map<String, dynamic> json) => HotKey._();

  HotKey._();

  KeyCode keyCode = KeyCode._;
  List<KeyModifier>? modifiers;
  String identifier = '';
  HotKeyScope scope = HotKeyScope._;

  Map<String, dynamic> toJson() => <String, dynamic>{};

  @override
  String toString() => '';
}

class GTKHeaderBar extends StatelessWidget implements PreferredSizeWidget {
  const GTKHeaderBar({
    super.key,
    this.trailing = const <Widget>[],
    this.leading = const <Widget>[],
    this.middle,
    this.bottom,
    this.height = 2,
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
    this.onWillPopCallback,
    this.backButtonStyle,
    this.backButtonColor,
    this.onDrawerButtonPressedCallback,
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
  final VoidCallback? onWillPopCallback;
  final ButtonStyle? backButtonStyle;
  final Color? backButtonColor;
  final VoidCallback? onDrawerButtonPressedCallback;
  final ButtonStyle? drawerButtonStyle;

  @override
  Size get preferredSize => Size.zero;

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
        ObjectFlagProperty<VoidCallback?>.has(
          'onWillPopCallback',
          onWillPopCallback,
        ),
      )
      ..add(
        DiagnosticsProperty<ButtonStyle?>('backButtonStyle', backButtonStyle),
      )
      ..add(ColorProperty('backButtonColor', backButtonColor))
      ..add(
        ObjectFlagProperty<VoidCallback?>.has(
          'onDrawerButtonPressedCallback',
          onDrawerButtonPressedCallback,
        ),
      )
      ..add(
        DiagnosticsProperty<ButtonStyle?>(
          'drawerButtonStyle',
          drawerButtonStyle,
        ),
      );
  }

  @override
  Widget build(final BuildContext context) => const SizedBox.shrink();
}

class _GTKLocalizations extends GTKLocalizations {
  _GTKLocalizations(super.locale);
}

abstract class GTKLocalizations {
  // ignore: avoid_unused_constructor_parameters
  GTKLocalizations(final String locale);

  String get localeName => '';

  static GTKLocalizations of(final BuildContext context) =>
      _GTKLocalizations('');

  static const LocalizationsDelegate<GTKLocalizations> delegate =
      _GTKLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[];

  static const List<Locale> supportedLocales = <Locale>[];
  String get appName => '';
  String get minimize => '';
  String get maximize => '';
  String get unmaximize => '';
}

class _GTKLocalizationsDelegate
    extends LocalizationsDelegate<GTKLocalizations> {
  const _GTKLocalizationsDelegate();

  @override
  Future<GTKLocalizations> load(final Locale locale) =>
      Future<GTKLocalizations>.value(_GTKLocalizations(''));

  @override
  bool isSupported(final Locale locale) => false;

  @override
  bool shouldReload(final _GTKLocalizationsDelegate old) => false;
}
