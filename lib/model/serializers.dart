import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'exchange_rate.dart';

part 'serializers.g.dart';

@SerializersFor([
  ExchangeRate,
  ExchangeRates,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
