import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'exchange_rate.g.dart';

abstract class ExchangeRate implements Built<ExchangeRate, ExchangeRateBuilder> {
  String get name;
  double get rate;

  ExchangeRate._();
  factory ExchangeRate([void Function(ExchangeRateBuilder) updates]) = _$ExchangeRate;

  static Serializer<ExchangeRate> get serializer => _$exchangeRateSerializer;
}

abstract class ExchangeRates implements Built<ExchangeRates, ExchangeRatesBuilder> {
  String get date;
  BuiltMap<String, double> get rate;
  BuiltList<ExchangeRate> get rates;

  ExchangeRates._();
  factory ExchangeRates([void Function(ExchangeRatesBuilder) updates]) = _$ExchangeRates;

  static Serializer<ExchangeRates> get serializer => _$exchangeRatesSerializer;
}
