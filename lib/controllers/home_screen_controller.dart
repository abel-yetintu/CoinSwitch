import 'package:coin_switch/models/home_screen_state.dart';
import 'package:coin_switch/services/currency_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeScreenControllerProvider = StateNotifierProvider<HomeScreenController, HomeScreenState>((ref) {
  var api = ref.watch(currencyApiProvider);
  return HomeScreenController(api: api);
});

class HomeScreenController extends StateNotifier<HomeScreenState> {
  final CurrencyApiService api;

  HomeScreenController({required this.api}) : super(HomeScreenState.initial()) {
    fetchCurrencies();
  }

  void fetchCurrencies() async {
    try {
      state = state.copyWith(currencies: const AsyncValue.loading());
      var codes = await api.getCurrencies();
      state = state.copyWith(currencies: AsyncValue.data(codes.supportedCodes));
    } catch (e, stackTrace) {
      state = state.copyWith(currencies: AsyncValue.error(e, stackTrace));
    }
  }

  void fetchConversionRates() async {
    try {
      if (state.baseCurrency != null) {
        state = state.copyWith(conversionRates: const AsyncValue.loading());
        var conversionRates = await api.getConversionRates(baseCurrency: state.baseCurrency!);
        state = state.copyWith(conversionRates: AsyncValue.data(conversionRates));
      }
    } catch (e, stackTrace) {
      state = state.copyWith(conversionRates: AsyncValue.error(e, stackTrace));
    }
  }

  void changeBaseCurrency(String baseCurrency) {
    state = state.copyWith(baseCurrency: baseCurrency);
  }

  void changeTargetCurrency(String targetCurrency) {
    state = state.copyWith(targetCurrency: targetCurrency);
  }

  void changeAmount(String value) {
    try {
      double amount = double.parse(value);
      state = state.copyWith(amount: amount);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void convertCurrency() async {
    if (state.baseCurrency != null && state.targetCurrency != null) {
      try {
        state = state.copyWith(currencyConversion: const AsyncValue.loading());
        var currencyConversion = await api.convertCurrency(
          baseCurrency: state.baseCurrency!,
          targetCurrency: state.targetCurrency!,
          amount: state.amount ?? 1,
        );
        state = state.copyWith(currencyConversion: AsyncValue.data(currencyConversion));
        fetchConversionRates();
      } catch (e, stackTrace) {
        debugPrint(e.toString());
        state = state.copyWith(currencyConversion: AsyncValue.error(e, stackTrace));
      }
    }
  }
}
