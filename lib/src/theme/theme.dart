// TODO: 適切なファイル分割を行う

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// アプリのライトモード用のThemeData
final lightTheme = ThemeData(
  colorSchemeSeed: Colors.green,
  fontFamily: GoogleFonts.dotGothic16().fontFamily,
  brightness: Brightness.light,
);

/// アプリのダークモード用のThemeData
final darkTheme = ThemeData(
  colorSchemeSeed: Colors.green,
  fontFamily: GoogleFonts.dotGothic16().fontFamily,
  brightness: Brightness.dark,
);

/// テーマモードを管理するNotifier
class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return ThemeMode.light;
  }

  void toggle() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

/// テーマモードを提供するProvider
final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);
