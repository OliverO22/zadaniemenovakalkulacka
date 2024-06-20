// main.dart

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:statemanazment/state.dart/state.dart';
import 'package:statemanazment/view/view.dart';

final store = Store<AppState>(initialState: AppState.initialState());

void main() {
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          title: 'Menova Kalkulačka',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: const DesktopView()),
    );
  }
}
