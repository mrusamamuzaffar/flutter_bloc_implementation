import 'package:flutter/material.dart';
import 'app_core_theme.dart';

class AppTheme {
  static final _core = AppCoreTheme(
    primary: const Color(0xff6585C0),
    accent: const Color(0xffEC8992),
    text: const Color(0xFF292c39),
    textSub: const Color(0xff9d9da6),
    background: const Color(0xFFF9F9F9),
    backgroundSub: const Color(0xFFF3FBFE),
    shadow: Colors.black.withOpacity(0.25),
    shadowSub: const Color(0xFFE5EEFF),
  );

  static AppCoreTheme light = _core;

  static AppCoreTheme dark = _core;

  static late AppCoreTheme c;

  // Init
  static init(BuildContext context) {
    c = isDark(context) ? dark : light;
  }

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
