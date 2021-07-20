part of 'theme_cubit.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  factory ThemeState.light() => _ThemeState(mode: ThemeMode.light);
  factory ThemeState.dark() => _ThemeState(mode: ThemeMode.dark);
  factory ThemeState.system() => _ThemeState(mode: ThemeMode.system);
  factory ThemeState({@themeModeConverter required ThemeMode mode}) =
      _ThemeState;

  factory ThemeState.fromJson(Map<String, dynamic> json) =>
      _$ThemeStateFromJson(json);
}
