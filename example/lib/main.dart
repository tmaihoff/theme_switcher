import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_switcher/cubit/theme_cubit.dart';
import 'package:theme_switcher/theme_switcher.dart';

Future<void> main() async {
  await initializeHydratedBloc();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeCubitProvider(
      builder: (context, themeState) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        themeMode: themeState.mode,
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                final ThemeMode mode = context.watch<ThemeCubit>().state.mode;
                return ToggleButtons(
                  children: [
                    Text('light'),
                    Text('dark'),
                    Text('system'),
                  ],
                  isSelected: [
                    mode == ThemeMode.light,
                    mode == ThemeMode.dark,
                    mode == ThemeMode.system,
                  ],
                  onPressed: (index) {
                    switch (index) {
                      case 0:
                        context.read<ThemeCubit>().setTheme(ThemeState.light());
                        break;
                      case 1:
                        context.read<ThemeCubit>().setTheme(ThemeState.dark());
                        break;
                      case 2:
                        context
                            .read<ThemeCubit>()
                            .setTheme(ThemeState.system());
                        break;
                      default:
                        context.read<ThemeCubit>().setTheme(ThemeState.light());
                        break;
                    }
                  },
                );
              },
            ),
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) => Text(state.toString()),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
