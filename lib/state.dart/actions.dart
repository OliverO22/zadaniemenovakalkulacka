import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart' as http;
import 'package:statemanazment/model/exchange_rate.dart';
import 'package:statemanazment/model/serializers.dart';
import 'dart:convert';
import 'state.dart';


class FetchExchangeRatesAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final response = await http
        .get(Uri.parse('https://api.financie.online/v2/app/vymennekurzy/'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final exchangeRates =
          serializers.deserializeWith(ExchangeRates.serializer, jsonResponse);
      return state.copy(exchangeRates: exchangeRates!);
    } else {
      throw Exception('Failed to load exchange rates');
    }
  }
}

class SetCurrencyAction extends ReduxAction<AppState> {
  final String fromCurrency;
  final String toCurrency;

  SetCurrencyAction({this.fromCurrency = "", this.toCurrency = ""});
  @override
  AppState reduce() {
    return state.copy(
      fromCurrency: fromCurrency.isNotEmpty ? fromCurrency : state.fromCurrency,
      toCurrency: toCurrency.isNotEmpty ? toCurrency : state.toCurrency,
    );
  }
}

class SetAmountAction extends ReduxAction<AppState> {
  final double amount;
  final bool switcher;

  SetAmountAction(this.amount, this.switcher);
  @override
  AppState reduce() {
    double fromRate = state.exchangeRates.rate[state.fromCurrency] ?? 1.0;
    double toRate = state.exchangeRates.rate[state.toCurrency] ?? 1.0;
    return state.copy(
      amount: switcher ? amount : amount / (toRate / fromRate),
      secAmount: switcher ? amount * (toRate / fromRate) : amount,
    );
  }
}
