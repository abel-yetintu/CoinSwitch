import 'dart:convert';

class CurrencyConversion {
  final String result;
  final String documentation;
  final String termsOfUse;
  final int timeLastUpdateUnix;
  final String timeLastUpdateUtc;
  final int timeNextUpdateUnix;
  final String timeNextUpdateUtc;
  final String baseCode;
  final String targetCode;
  final double conversionRate;
  final double conversionResult;

  CurrencyConversion({
    required this.result,
    required this.documentation,
    required this.termsOfUse,
    required this.timeLastUpdateUnix,
    required this.timeLastUpdateUtc,
    required this.timeNextUpdateUnix,
    required this.timeNextUpdateUtc,
    required this.baseCode,
    required this.targetCode,
    required this.conversionRate,
    required this.conversionResult,
  });

  CurrencyConversion copyWith({
    String? result,
    String? documentation,
    String? termsOfUse,
    int? timeLastUpdateUnix,
    String? timeLastUpdateUtc,
    int? timeNextUpdateUnix,
    String? timeNextUpdateUtc,
    String? baseCode,
    String? targetCode,
    double? conversionRate,
    double? conversionResult,
  }) =>
      CurrencyConversion(
        result: result ?? this.result,
        documentation: documentation ?? this.documentation,
        termsOfUse: termsOfUse ?? this.termsOfUse,
        timeLastUpdateUnix: timeLastUpdateUnix ?? this.timeLastUpdateUnix,
        timeLastUpdateUtc: timeLastUpdateUtc ?? this.timeLastUpdateUtc,
        timeNextUpdateUnix: timeNextUpdateUnix ?? this.timeNextUpdateUnix,
        timeNextUpdateUtc: timeNextUpdateUtc ?? this.timeNextUpdateUtc,
        baseCode: baseCode ?? this.baseCode,
        targetCode: targetCode ?? this.targetCode,
        conversionRate: conversionRate ?? this.conversionRate,
        conversionResult: conversionResult ?? this.conversionResult,
      );

  factory CurrencyConversion.fromJson(String str) => CurrencyConversion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CurrencyConversion.fromMap(Map<String, dynamic> json) => CurrencyConversion(
        result: json["result"],
        documentation: json["documentation"],
        termsOfUse: json["terms_of_use"],
        timeLastUpdateUnix: json["time_last_update_unix"],
        timeLastUpdateUtc: json["time_last_update_utc"],
        timeNextUpdateUnix: json["time_next_update_unix"],
        timeNextUpdateUtc: json["time_next_update_utc"],
        baseCode: json["base_code"],
        targetCode: json["target_code"],
        conversionRate: json["conversion_rate"]?.toDouble(),
        conversionResult: json["conversion_result"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "result": result,
        "documentation": documentation,
        "terms_of_use": termsOfUse,
        "time_last_update_unix": timeLastUpdateUnix,
        "time_last_update_utc": timeLastUpdateUtc,
        "time_next_update_unix": timeNextUpdateUnix,
        "time_next_update_utc": timeNextUpdateUtc,
        "base_code": baseCode,
        "target_code": targetCode,
        "conversion_rate": conversionRate,
        "conversion_result": conversionResult,
      };
}
