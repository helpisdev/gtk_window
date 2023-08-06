// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:window_manager/window_manager.dart';

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

  static final HotKey _fullscreenF = HotKey(
    KeyCode.keyF,
    modifiers: <KeyModifier>[],
    scope: HotKeyScope.inapp,
  );

  static final HotKey _escape = HotKey(
    KeyCode.escape,
    modifiers: <KeyModifier>[],
    scope: HotKeyScope.inapp,
  );

  static Future<void> configureFullScreen(final HotKeyHandler listener) async {
    await hotKeyManager.register(_fullscreenF, keyDownHandler: listener);
    await hotKeyManager.register(_escape, keyDownHandler: listener);
  }
}

final HotKey F = GTKManager._fullscreenF;
