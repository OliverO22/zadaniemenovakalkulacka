// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ExchangeRate> _$exchangeRateSerializer =
    new _$ExchangeRateSerializer();
Serializer<ExchangeRates> _$exchangeRatesSerializer =
    new _$ExchangeRatesSerializer();

class _$ExchangeRateSerializer implements StructuredSerializer<ExchangeRate> {
  @override
  final Iterable<Type> types = const [ExchangeRate, _$ExchangeRate];
  @override
  final String wireName = 'ExchangeRate';

  @override
  Iterable<Object?> serialize(Serializers serializers, ExchangeRate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'rate',
      serializers.serialize(object.rate, specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  ExchangeRate deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExchangeRateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$ExchangeRatesSerializer implements StructuredSerializer<ExchangeRates> {
  @override
  final Iterable<Type> types = const [ExchangeRates, _$ExchangeRates];
  @override
  final String wireName = 'ExchangeRates';

  @override
  Iterable<Object?> serialize(Serializers serializers, ExchangeRates object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'rate',
      serializers.serialize(object.rate,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(double)])),
      'rates',
      serializers.serialize(object.rates,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ExchangeRate)])),
    ];

    return result;
  }

  @override
  ExchangeRates deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExchangeRatesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'rate':
          result.rate.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(double)]))!);
          break;
        case 'rates':
          result.rates.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ExchangeRate)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ExchangeRate extends ExchangeRate {
  @override
  final String name;
  @override
  final double rate;

  factory _$ExchangeRate([void Function(ExchangeRateBuilder)? updates]) =>
      (new ExchangeRateBuilder()..update(updates))._build();

  _$ExchangeRate._({required this.name, required this.rate}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ExchangeRate', 'name');
    BuiltValueNullFieldError.checkNotNull(rate, r'ExchangeRate', 'rate');
  }

  @override
  ExchangeRate rebuild(void Function(ExchangeRateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExchangeRateBuilder toBuilder() => new ExchangeRateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExchangeRate && name == other.name && rate == other.rate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExchangeRate')
          ..add('name', name)
          ..add('rate', rate))
        .toString();
  }
}

class ExchangeRateBuilder
    implements Builder<ExchangeRate, ExchangeRateBuilder> {
  _$ExchangeRate? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _rate;
  double? get rate => _$this._rate;
  set rate(double? rate) => _$this._rate = rate;

  ExchangeRateBuilder();

  ExchangeRateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _rate = $v.rate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExchangeRate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExchangeRate;
  }

  @override
  void update(void Function(ExchangeRateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExchangeRate build() => _build();

  _$ExchangeRate _build() {
    final _$result = _$v ??
        new _$ExchangeRate._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ExchangeRate', 'name'),
            rate: BuiltValueNullFieldError.checkNotNull(
                rate, r'ExchangeRate', 'rate'));
    replace(_$result);
    return _$result;
  }
}

class _$ExchangeRates extends ExchangeRates {
  @override
  final String date;
  @override
  final BuiltMap<String, double> rate;
  @override
  final BuiltList<ExchangeRate> rates;

  factory _$ExchangeRates([void Function(ExchangeRatesBuilder)? updates]) =>
      (new ExchangeRatesBuilder()..update(updates))._build();

  _$ExchangeRates._(
      {required this.date, required this.rate, required this.rates})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(date, r'ExchangeRates', 'date');
    BuiltValueNullFieldError.checkNotNull(rate, r'ExchangeRates', 'rate');
    BuiltValueNullFieldError.checkNotNull(rates, r'ExchangeRates', 'rates');
  }

  @override
  ExchangeRates rebuild(void Function(ExchangeRatesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExchangeRatesBuilder toBuilder() => new ExchangeRatesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExchangeRates &&
        date == other.date &&
        rate == other.rate &&
        rates == other.rates;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jc(_$hash, rates.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExchangeRates')
          ..add('date', date)
          ..add('rate', rate)
          ..add('rates', rates))
        .toString();
  }
}

class ExchangeRatesBuilder
    implements Builder<ExchangeRates, ExchangeRatesBuilder> {
  _$ExchangeRates? _$v;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  MapBuilder<String, double>? _rate;
  MapBuilder<String, double> get rate =>
      _$this._rate ??= new MapBuilder<String, double>();
  set rate(MapBuilder<String, double>? rate) => _$this._rate = rate;

  ListBuilder<ExchangeRate>? _rates;
  ListBuilder<ExchangeRate> get rates =>
      _$this._rates ??= new ListBuilder<ExchangeRate>();
  set rates(ListBuilder<ExchangeRate>? rates) => _$this._rates = rates;

  ExchangeRatesBuilder();

  ExchangeRatesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _rate = $v.rate.toBuilder();
      _rates = $v.rates.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExchangeRates other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExchangeRates;
  }

  @override
  void update(void Function(ExchangeRatesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExchangeRates build() => _build();

  _$ExchangeRates _build() {
    _$ExchangeRates _$result;
    try {
      _$result = _$v ??
          new _$ExchangeRates._(
              date: BuiltValueNullFieldError.checkNotNull(
                  date, r'ExchangeRates', 'date'),
              rate: rate.build(),
              rates: rates.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'rate';
        rate.build();
        _$failedField = 'rates';
        rates.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ExchangeRates', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
