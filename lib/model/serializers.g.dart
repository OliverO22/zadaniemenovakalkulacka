// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(ExchangeRate.serializer)
      ..add(ExchangeRates.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(double)]),
          () => new MapBuilder<String, double>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ExchangeRate)]),
          () => new ListBuilder<ExchangeRate>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
