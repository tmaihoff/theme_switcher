import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// [JsonConverter] for [ThemeMode].
const ThemeModeConverter themeModeConverter = ThemeModeConverter();

/// [JsonConverter] for [ThemeMode].
class ThemeModeConverter implements JsonConverter<ThemeMode, int> {
  const ThemeModeConverter();

  @override
  ThemeMode fromJson(int index) {
    try {
      return ThemeMode.values[index];
    } catch (e) {
      return ThemeMode.light;
    }
  }

  @override
  int toJson(ThemeMode mode) {
    return mode.index;
  }
}
