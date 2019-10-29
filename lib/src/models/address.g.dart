// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    postalCode: json['postalCode'] as String,
    line1: json['line1'] as String,
    line2: json['line2'] as String,
    line3: json['line3'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    countryCode: json['countryCode'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'postalCode': instance.postalCode,
      'line1': instance.line1,
      'line2': instance.line2,
      'line3': instance.line3,
      'city': instance.city,
      'state': instance.state,
      'countryCode': instance.countryCode,
    };
