import 'package:built_collection/built_collection.dart';
import 'package:statemanazment/model/exchange_rate.dart';


class AppState {
  final ExchangeRates exchangeRates;
  final double amount;
  final double secAmount;
  final String fromCurrency;
  final String toCurrency;

  AppState({
    required this.exchangeRates,
    this.amount = 0,
    this.secAmount = 0,
    this.fromCurrency = "EUR",
    this.toCurrency = "USD",
  });

  AppState copy({
    ExchangeRates? exchangeRates,
    double? amount,
    double? secAmount,
    String? fromCurrency,
    String? toCurrency,
  }) {
    return AppState(
      exchangeRates: exchangeRates ?? this.exchangeRates,
      amount: amount ?? this.amount,
      secAmount: secAmount ?? this.secAmount,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
    );
  }

  static AppState initialState() => AppState(
      exchangeRates: ExchangeRates((b) => b
        ..date = ''
        ..rate = MapBuilder<String, double>()
        ..rates = ListBuilder<ExchangeRate>()));
}
