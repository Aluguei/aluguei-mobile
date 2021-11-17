import 'package:json_annotation/json_annotation.dart';

class ProductData {
  final int id;
  final String productName;
  final String category;
  final String humanCategory;
  final String imageUrl;
  final int value;
  final int rentTime;
  final String timeUnit;
  final String humanTimeUnit;
  final String description;
  final bool isActive;
  final bool isLent;
  final Advertiser advertiser;

  const ProductData({
    required this.id,
    required this.productName,
    required this.category,
    required this.humanCategory,
    required this.imageUrl,
    required this.value,
    required this.rentTime,
    required this.timeUnit,
    required this.humanTimeUnit,
    required this.description,
    required this.isActive,
    required this.isLent,
    required this.advertiser,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
        id: json['id'] as int,
        productName: json['name'] as String,
        category: json['category'] as String,
        humanCategory: json['humanCategory'] as String,
        imageUrl: json['imageUrl'] as String,
        value: json['price'] as int,
        rentTime: json['timeQuantity'] as int,
        timeUnit: json['timeUnit'] as String,
        humanTimeUnit: json['humanTimeUnit'] as String,
        description: json['description'] as String,
        isActive: json['isActive'] as bool,
        isLent: json['isLent'] as bool,
        advertiser: Advertiser.fromJson(json['owner']));
  }
}

@JsonSerializable()
class Advertiser {
  final int id;
  final String name;
  final String fullName;
  final String lastName;
  final String address;
  final String state;
  final String city;
  final String phoneOne;
  final String phoneTwo;

  const Advertiser(
      {required this.id,
      required this.name,
      required this.fullName,
      required this.lastName,
      required this.address,
      required this.state,
      required this.city,
      required this.phoneOne,
      required this.phoneTwo});

  factory Advertiser.fromJson(Map<String, dynamic> json) {
    return Advertiser(
      id: json['id'] as int,
      name: json['firstName'] as String,
      fullName: json['fullName'] as String,
      lastName: json['lastName'] as String,
      address: json['address'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      phoneOne: json['phoneOne'] as String,
      phoneTwo: json['phoneTwo'] as String,
    );
  }
}
