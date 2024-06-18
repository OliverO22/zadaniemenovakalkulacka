import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:statemanazment/state.dart/actions.dart';
import 'package:statemanazment/state.dart/state.dart';
import 'package:statemanazment/view/custom_widget.dart';


class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  DesktopViewState createState() => DesktopViewState();
}

class DesktopViewState extends State<DesktopView> {
  @override
  Widget build(BuildContext context) {
    StoreProvider.dispatch(context, FetchExchangeRatesAction());
    return Scaffold(
      appBar: AppBar(title: const ResponsiveAppBarTitle()),
      body: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, state) {
            return const Center(child: ResponsiveContainer());
          }),
    );
  }
}
