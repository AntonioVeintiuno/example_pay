// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    externalId: json['externalId'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    lastName: json['lastName'] as String,
    phoneNumber: json['phoneNumber'] as String,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    status: json['status'] as String,
    clabe: json['clabe'] as String,
    balance: (json['balance'] as num)?.toDouble(),
    creationDate: json['creationDate'] == null
        ? null
        : DateTime.parse(json['creationDate'] as String),
    requiresAccount: json['requiresAccount'] as bool,
  )..id = json['id'] as String;
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'externalId': instance.externalId,
      'name': instance.name,
      'email': instance.email,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'status': instance.status,
      'clabe': instance.clabe,
      'balance': instance.balance,
      'creationDate': instance.creationDate?.toIso8601String(),
      'requiresAccount': instance.requiresAccount,
    };
