import 'dart:convert';

class Codes {
  final String result;
  final String documentation;
  final String termsOfUse;
  final List<List<String>> supportedCodes;

  Codes({
    required this.result,
    required this.documentation,
    required this.termsOfUse,
    required this.supportedCodes,
  });

  Codes copyWith({
    String? result,
    String? documentation,
    String? termsOfUse,
    List<List<String>>? supportedCodes,
  }) =>
      Codes(
        result: result ?? this.result,
        documentation: documentation ?? this.documentation,
        termsOfUse: termsOfUse ?? this.termsOfUse,
        supportedCodes: supportedCodes ?? this.supportedCodes,
      );

  factory Codes.fromJson(String str) => Codes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Codes.fromMap(Map<String, dynamic> json) => Codes(
        result: json["result"],
        documentation: json["documentation"],
        termsOfUse: json["terms_of_use"],
        supportedCodes: List<List<String>>.from(json["supported_codes"].map((x) => List<String>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toMap() => {
        "result": result,
        "documentation": documentation,
        "terms_of_use": termsOfUse,
        "supported_codes": List<dynamic>.from(supportedCodes.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
