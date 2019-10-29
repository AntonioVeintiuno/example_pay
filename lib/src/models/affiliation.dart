import 'package:json_annotation/json_annotation.dart';

part 'affiliation.g.dart';

@JsonSerializable(nullable: false)
class Affiliation {

  String number;
  String name;
  String merchantName;

  Affiliation({
    this.number,
    this.name,
    this.merchantName
  });

  factory Affiliation.fromJson(Map<String, dynamic> json) => _$AffiliationFromJson(json);
  Map<String, dynamic> toJson() => _$AffiliationToJson(this);
}
