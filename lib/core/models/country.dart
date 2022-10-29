import 'package:ride_sharing/data/countries.dart';

class CountryCode {
  /// the name of the country
  String? name;

  /// the flag of the country
  String? flagUri;

  /// the country code (IT,AF..)
  String? code;

  /// the dial code (+39,+93..)
  String? dialCode;

  CountryCode({this.name, this.flagUri, this.code, this.dialCode});

  @override
  String toString() => "$dialCode";

  String toLongString() => "$dialCode $name";

  String toCountryStringOnly() => '$name';

  static List<CountryCode> getCountryLIst() {
    List<Map> jsonList = countriesEnglish;

    List<CountryCode> countryList = jsonList
        .map((s) => CountryCode(
              name: s['name'],
              code: s['code'],
              dialCode: s['dial_code'],
              flagUri: 'assets/flags/${s['code'].toLowerCase()}.png',
            ))
        .toList();

    return countryList;
  }
}
