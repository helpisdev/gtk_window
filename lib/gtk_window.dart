// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:window_manager/window_manager.dart';

export 'package:hotkey_manager/hotkey_manager.dart';
export 'package:window_manager/window_manager.dart';

export 'src/gen/app_localizations.dart';
export 'src/widgets/header_bar.dart';

class GTKManager {
  static Future<void> ensureInitialized({
    final WindowOptions options = const WindowOptions(
      size: Size(800, 600),
      center: true,
      fullScreen: false,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    ),
  }) async {
    await windowManager.ensureInitialized();
    await hotKeyManager.unregisterAll();
    await windowManager.waitUntilReadyToShow(
      options,
      () async {
        await windowManager.show();
        await windowManager.focus();
      },
    );
  }

  static final HotKey fullscreenF = HotKey(
    KeyCode.keyF,
    modifiers: <KeyModifier>[],
    scope: HotKeyScope.inapp,
  );

  static final HotKey escape = HotKey(
    KeyCode.escape,
    modifiers: <KeyModifier>[],
    scope: HotKeyScope.inapp,
  );

  static Future<void> configureFullScreen(final HotKeyHandler listener) async {
    await hotKeyManager.register(fullscreenF, keyDownHandler: listener);
    await hotKeyManager.register(escape, keyDownHandler: listener);
  }
}
