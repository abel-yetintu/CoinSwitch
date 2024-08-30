import 'dart:convert';

class ConversionRates {
  final String result;
  final String documentation;
  final String termsOfUse;
  final int timeLastUpdateUnix;
  final String timeLastUpdateUtc;
  final int timeNextUpdateUnix;
  final String timeNextUpdateUtc;
  final String baseCode;
  final Map<String, double> conversionRates;

  ConversionRates({
    required this.result,
    required this.documentation,
    required this.termsOfUse,
    required this.timeLastUpdateUnix,
    required this.timeLastUpdateUtc,
    required this.timeNextUpdateUnix,
    required this.timeNextUpdateUtc,
    required this.baseCode,
    required this.conversionRates,
  });

  ConversionRates copyWith({
    String? result,
    String? documentation,
    String? termsOfUse,
    int? timeLastUpdateUnix,
    String? timeLastUpdateUtc,
    int? timeNextUpdateUnix,
    String? timeNextUpdateUtc,
    String? baseCode,
    Map<String, double>? conversionRates,
  }) =>
      ConversionRates(
        result: result ?? this.result,
        documentation: documentation ?? this.documentation,
        termsOfUse: termsOfUse ?? this.termsOfUse,
        timeLastUpdateUnix: timeLastUpdateUnix ?? this.timeLastUpdateUnix,
        timeLastUpdateUtc: timeLastUpdateUtc ?? this.timeLastUpdateUtc,
        timeNextUpdateUnix: timeNextUpdateUnix ?? this.timeNextUpdateUnix,
        timeNextUpdateUtc: timeNextUpdateUtc ?? this.timeNextUpdateUtc,
        baseCode: baseCode ?? this.baseCode,
        conversionRates: conversionRates ?? this.conversionRates,
      );

  factory ConversionRates.fromJson(String str) => ConversionRates.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConversionRates.fromMap(Map<String, dynamic> json) => ConversionRates(
        result: json["result"],
        documentation: json["documentation"],
        termsOfUse: json["terms_of_use"],
        timeLastUpdateUnix: json["time_last_update_unix"],
        timeLastUpdateUtc: json["time_last_update_utc"],
        timeNextUpdateUnix: json["time_next_update_unix"],
        timeNextUpdateUtc: json["time_next_update_utc"],
        baseCode: json["base_code"],
        conversionRates: Map.from(json["conversion_rates"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
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
        "conversion_rates": Map.from(conversionRates).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
