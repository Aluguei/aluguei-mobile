class RentedProductData {
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

  const RentedProductData({
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
  });

  factory RentedProductData.fromJson(Map<String, dynamic> json) {
    return RentedProductData(
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
        isLent: json['isLent'] as bool);
  }
}