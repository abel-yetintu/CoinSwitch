enum Currencies {
  AED(currencyName: 'UAE Dirham'),
  AUD(currencyName: 'Australian Dollar'),
  BRL(currencyName: 'Brazilian Real'),
  CAD(currencyName: 'Canadian Dollar'),
  CHF(currencyName: 'Swiss Franc'),
  CNY(currencyName: 'Chinese Renminbi'),
  ETB(currencyName: 'Ethiopian Birr'),
  EUR(currencyName: 'Euro'),
  GBP(currencyName: 'Pound Sterling'),
  INR(currencyName: 'Indian Rupee'),
  JPY(currencyName: 'Japanese Yen'),
  KES(currencyName: 'Kenyan Shilling'),
  KRW(currencyName: 'South Korean Won'),
  KWD(currencyName: 'Kuwaiti Dinar'),
  NGN(currencyName: 'Nigerian Naira'),
  NOK(currencyName: 'Norwegian Krone'),
  NZD(currencyName: 'New Zealand Dollar'),
  PHP(currencyName: 'Philippine Peso'),
  PLN(currencyName: 'Polish Złoty'),
  RUB(currencyName: 'Russian Ruble'),
  SAR(currencyName: 'Saudi Riyal'),
  THB(currencyName: 'Thai Baht'),
  TRY(currencyName: 'Turkish Lira'),
  USD(currencyName: 'United States Dollar'),
  ZAR(currencyName: 'South African Rand');

  final String currencyName;

  const Currencies({required this.currencyName});
}
