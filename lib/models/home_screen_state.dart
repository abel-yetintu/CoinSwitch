// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:coin_switch/models/conversion_rate.dart';
import 'package:coin_switch/models/currency_conversion.dart';

class HomeScreenState {
  AsyncValue<List<String>> currencies;
  String? baseCurrency;
  String? targetCurrency;
  double? amount;
  AsyncValue<CurrencyConversion?> currencyConversion;
  AsyncValue<ConversionRates?> conversionRates;

  HomeScreenState({
    required this.currencies,
    required this.baseCurrency,
    required this.targetCurrency,
    required this.amount,
    required this.currencyConversion,
    required this.conversionRates,
  });

  HomeScreenState.initial()
      : currencies = const AsyncValue.loading(),
        conversionRates = const AsyncValue.data(null),
        currencyConversion = const AsyncValue.data(null);

  HomeScreenState copyWith({
    AsyncValue<List<String>>? currencies,
    String? baseCurrency,
    String? targetCurrency,
    double? amount,
    AsyncValue<CurrencyConversion?>? currencyConversion,
    AsyncValue<ConversionRates?>? conversionRates,
  }) {
    return HomeScreenState(
      currencies: currencies ?? this.currencies,
      baseCurrency: baseCurrency ?? this.baseCurrency,
      targetCurrency: targetCurrency ?? this.targetCurrency,
      amount: amount ?? this.amount,
      currencyConversion: currencyConversion ?? this.currencyConversion,
      conversionRates: conversionRates ?? this.conversionRates,
    );
  }
}
