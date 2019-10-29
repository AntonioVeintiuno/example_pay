import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable(nullable: true)
class Address {
  String postalCode;
  String line1;
  String line2;
  String line3;
  String city;
  String state;
  String countryCode;

  Address({ this.postalCode,
    this.line1,
    this.line2,
    this.line3,
    this.city,
    this.state,
    this.countryCode
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
