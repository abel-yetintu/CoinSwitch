import 'package:coin_switch/models/conversion_rate.dart';
import 'package:coin_switch/models/currency_conversion.dart';
import 'package:coin_switch/shared/creds.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currencyApiProvider = Provider((ref) => CurrencyApiService());

class CurrencyApiService {
  final Dio _dio = Dio();

  Future<List<String>> getCurrencies() async {
    List<String> curriencies = [];
    try {
      var res = await _dio.get('https://v6.exchangerate-api.com/v6/${Creds.apiKey}/latest/ETB');
      var conversionRate = ConversionRates.fromMap(res.data);
      conversionRate.conversionRates.forEach((code, rate) {
        curriencies.add(code);
      });
      return curriencies;
    } on DioException catch (_) {
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<ConversionRates> getConversionRates({required String baseCurrency}) async {
    try {
      var res = await _dio.get('https://v6.exchangerate-api.com/v6/${Creds.apiKey}/latest/$baseCurrency');
      return ConversionRates.fromMap(res.data);
    } on DioException catch (e) {
      throw Exception('with ${e.response?.statusCode} status code.');
    } catch (e) {
      throw Exception('Unkown error.');
    }
  }

  Future<CurrencyConversion> convertCurrency({
    required String baseCurrency,
    required String targetCurrency,
    required double amount,
  }) async {
    try {
      var res = await _dio.get('https://v6.exchangerate-api.com/v6/${Creds.apiKey}/pair/$baseCurrency/$targetCurrency/$amount');
      return CurrencyConversion.fromMap(res.data);
    } on DioException catch (e) {
      throw Exception('with ${e.response?.statusCode} status code.');
    } catch (e) {
      throw Exception('Unkown error.');
    }
  }
}
