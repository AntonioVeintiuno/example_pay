import 'package:example_pay/src/models/address.dart';
import 'package:example_pay/src/models/open_pay_base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable(nullable: true)
class Customer extends OpenPayBaseModel {
  String externalId;
  String name;
  String email;
  String lastName;
  String phoneNumber;
  Address address;
  String status;
  String clabe;
  double balance;
  DateTime creationDate;
  bool requiresAccount;

  Customer({
    this.externalId,
    this.name,
    this.email,
    this.lastName,
    this.phoneNumber,
    this.address,
    this.status,
    this.clabe,
    this.balance,
    this.creationDate,
    this.requiresAccount,
  });


  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
  Customer fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
