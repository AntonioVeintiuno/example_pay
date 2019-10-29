// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affiliation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Affiliation _$AffiliationFromJson(Map<String, dynamic> json) {
  return Affiliation(
    number: json['number'] as String,
    name: json['name'] as String,
    merchantName: json['merchantName'] as String,
  );
}

Map<String, dynamic> _$AffiliationToJson(Affiliation instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'merchantName': instance.merchantName,
    };
