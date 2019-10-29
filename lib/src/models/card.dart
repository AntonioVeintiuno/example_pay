import 'package:example_pay/src/models/address.dart';
import 'package:example_pay/src/models/affiliation.dart';
import 'package:example_pay/src/models/open_pay_base_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'card.g.dart';

@JsonSerializable(nullable: true)
class Card extends OpenPayBaseModel {
  String tokenId;
  @JsonKey(nullable: true)
  DateTime creationDate;
  String bankName;
  bool allowsPayouts;
  String holderName;
  String expirationMonth;
  String expirationYear;
  Address address;
  String cardNumber;
  String brand;
  bool allowsCharges;
  String bankCode;
  String type;
  String cvv2;
  String deviceSessionId;
  bool pointsCard;
  String pointsType;
  Affiliation affiliation;
  String customerId;

  Card({ this.tokenId,
    this.creationDate,
    this.bankName,
    this.allowsPayouts,
    this.holderName,
    this.expirationMonth,
    this.expirationYear,
    this.address,
    this.cardNumber,
    this.brand,
    this.allowsCharges,
    this.bankCode,
    this.type,
    this.cvv2,
    this.deviceSessionId,
    this.pointsCard,
    this.pointsType,
    this.affiliation
  });

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  Card fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
  Map<String, dynamic> toJson() => _$CardToJson(this);
}
