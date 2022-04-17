import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PromotionModel {
  final String AdvertiserId;
  final String AdvertiserName;
  final String LinkId;
  PromotionModel({
    required this.AdvertiserId,
    required this.AdvertiserName,
    required this.LinkId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'AdvertiserId': AdvertiserId,
      'AdvertiserName': AdvertiserName,
      'LinkId': LinkId,
    };
  }

  factory PromotionModel.fromMap(Map<String, dynamic> map) {
    return PromotionModel(
      AdvertiserId: (map['AdvertiserId'] ?? '') as String,
      AdvertiserName: (map['AdvertiserName'] ?? '') as String,
      LinkId: (map['LinkId'] ?? '') as String,
    );
  }

  factory PromotionModel.fromJson(String source) =>
      PromotionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
