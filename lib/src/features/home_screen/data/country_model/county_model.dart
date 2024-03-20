import '../models/location_model/location_model.dart';

class Country {
final  String addressLine;
final  String countryNameCode;
final  String countryName;
final  AdministrativeArea administrativeArea;
  Country copyWith(
      {String? addressLine,
      String? countryNameCode,
      String? countryName,
      AdministrativeArea? administrativeArea}) {
    return Country(
        addressLine: addressLine ?? this.addressLine,
        countryNameCode: countryNameCode ?? this.countryNameCode,
        countryName: countryName ?? this.countryName,
        administrativeArea: administrativeArea?? this.administrativeArea);
  }

  Country({
    required this.addressLine,
    required this.countryNameCode,
    required this.countryName,
    required this.administrativeArea,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        addressLine: json["AddressLine"],
        countryNameCode: json["CountryNameCode"],
        countryName: json["CountryName"],
        administrativeArea:
            AdministrativeArea.fromJson(json["AdministrativeArea"]),
      );

  Map<String, dynamic> toJson() => {
        "AddressLine": addressLine,
        "CountryNameCode": countryNameCode,
        "CountryName": countryName,
        "AdministrativeArea": administrativeArea.toJson(),
      };
}
