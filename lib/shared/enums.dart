enum Currency {
  AED(currencyName: 'UAE Dirham', countryCode: 'AE'),
  AUD(currencyName: 'Australian Dollar', countryCode: 'AU'),
  BRL(currencyName: 'Brazilian Real', countryCode: 'BR'),
  CAD(currencyName: 'Canadian Dollar', countryCode: 'CA'),
  CHF(currencyName: 'Swiss Franc', countryCode: 'CH'),
  CNY(currencyName: 'Chinese Renminbi', countryCode: 'CN'),
  ETB(currencyName: 'Ethiopian Birr', countryCode: 'ET'),
  EUR(currencyName: 'Euro', countryCode: 'EU'),
  GBP(currencyName: 'Pound Sterling', countryCode: 'GB'),
  INR(currencyName: 'Indian Rupee', countryCode: 'IN'),
  JPY(currencyName: 'Japanese Yen', countryCode: 'JP'),
  KES(currencyName: 'Kenyan Shilling', countryCode: 'KE'),
  KRW(currencyName: 'South Korean Won', countryCode: 'KR'),
  KWD(currencyName: 'Kuwaiti Dinar', countryCode: 'KW'),
  NGN(currencyName: 'Nigerian Naira', countryCode: 'NG'),
  NOK(currencyName: 'Norwegian Krone', countryCode: 'NO'),
  NZD(currencyName: 'New Zealand Dollar', countryCode: 'NZ'),
  PHP(currencyName: 'Philippine Peso', countryCode: 'PH'),
  PLN(currencyName: 'Polish Złoty', countryCode: 'PL'),
  RUB(currencyName: 'Russian Ruble', countryCode: 'RU'),
  SAR(currencyName: 'Saudi Riyal', countryCode: 'SA'),
  THB(currencyName: 'Thai Baht', countryCode: 'TH'),
  TRY(currencyName: 'Turkish Lira', countryCode: 'TR'),
  USD(currencyName: 'United States Dollar', countryCode: 'US'),
  ZAR(currencyName: 'South African Rand', countryCode: 'ZA');

  final String currencyName;
  final String countryCode;

  const Currency({required this.currencyName, required this.countryCode});
}
