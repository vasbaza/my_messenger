import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_messanger/models/app_state.dart';
import 'package:my_messanger/ui/features/home/home_screen.dart';
import 'package:my_messanger/ui/resources/app_theme.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {
  final Store<AppState> store;

  const App({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: appTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
