import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/theme_cubit.dart';

/// Wrap material app inside this builder for simple use
///
/// Example:
/// ```dart
/// class MyApp extends StatelessWidget {
///  @override
///  Widget build(BuildContext context) {
///    return ThemeCubitProvider(
///      builder: (context, themeState) => MaterialApp(
///        title: 'Flutter Demo',
///        theme: ThemeData(),
///        darkTheme: ThemeData.dark(),
///        themeMode: themeState.mode,
///        home: MyHomePage(title: 'Flutter Demo Home Page'),
///      ),
///    );
///  }
///}
///```
/// Alternately, you can access the theme state by calling
/// `context.watch<ThemeCubit>().state.mode`
class ThemeCubitProvider extends StatelessWidget {
  const ThemeCubitProvider({Key? key, required this.builder}) : super(key: key);

  final Widget Function(BuildContext context, ThemeState themeState) builder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: Builder(
        builder: (context) =>
            BlocBuilder<ThemeCubit, ThemeState>(builder: builder),
      ),
    );
  }
}
