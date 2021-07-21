import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:theme_switcher/cubit/theme_mode_converter.dart';

part 'theme_cubit.freezed.dart';
part 'theme_cubit.g.dart';
part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  /// Cubit for changing and accessing app theme mode.
  ///
  /// When using this, call `await initialize_hydrated_bloc()`
  /// before `runApp()`.
  ThemeCubit() : super(ThemeState.light());

  void setTheme(ThemeState themeState) => emit(themeState);

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toJson();
  }
}
