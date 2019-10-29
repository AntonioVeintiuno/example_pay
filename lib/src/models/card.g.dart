// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) {
  return Card(
    tokenId: json['tokenId'] as String,
    creationDate: json['creationDate'] == null
      ? null
      : DateTime.parse(json['creationDate'] as String),
    bankName: json['bankName'] as String,
    allowsPayouts: json['allowsPayouts'] as bool,
    holderName: json['holderName'] as String,
    expirationMonth: json['expirationMonth'] as String,
    expirationYear: json['expirationYear'] as String,
    address: json['address'] == null
      ? null
      : Address.fromJson(json['address'] as Map<String, dynamic>),
    cardNumber: json['cardNumber'] as String,
    brand: json['brand'] as String,
    allowsCharges: json['allowsCharges'] as bool,
    bankCode: json['bankCode'] as String,
    type: json['type'] as String,
    cvv2: json['cvv2'] as String,
    deviceSessionId: json['deviceSessionId'] as String,
    pointsCard: json['pointsCard'] as bool,
    pointsType: json['pointsType'] as String,
    affiliation: json['affiliation'] == null
      ? null
      : Affiliation.fromJson(json['affiliation'] as Map<String, dynamic>),
  )
  ..id = json['id'] as String
  ..customerId = json['customerId'] as String;
}

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'id': instance.id,
      'tokenId': instance.tokenId,
      'creationDate': instance.creationDate?.toIso8601String(),
      'bankName': instance.bankName,
      'allowsPayouts': instance.allowsPayouts,
      'holderName': instance.holderName,
      'expirationMonth': instance.expirationMonth,
      'expirationYear': instance.expirationYear,
      'address': instance.address,
      'cardNumber': instance.cardNumber,
      'brand': instance.brand,
      'allowsCharges': instance.allowsCharges,
      'bankCode': instance.bankCode,
      'type': instance.type,
      'cvv2': instance.cvv2,
      'deviceSessionId': instance.deviceSessionId,
      'pointsCard': instance.pointsCard,
      'pointsType': instance.pointsType,
      'affiliation': instance.affiliation,
      'customerId': instance.customerId,
    };
