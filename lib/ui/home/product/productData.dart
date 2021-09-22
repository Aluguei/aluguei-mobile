class ProductData {
  final int id;
  final String productName;
  final String category;
  final String imageUrl;
  final String value;
  final String rentTime;
  final String description;
  final Advertiser advertiser;

  const ProductData({
    required this.id,
    required this.productName,
    required this.category,
    required this.imageUrl,
    required this.value,
    required this.rentTime,
    required this.description,
    required this.advertiser,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['albumId'] as int,
      productName: json['albumId'] as String,
      category: json['albumId'] as String,
      imageUrl: json['albumId'] as String,
      value: json['albumId'] as String,
      rentTime: json['albumId'] as String,
      description: json['albumId'] as String,
      advertiser: json['albumId'] as Advertiser,
    );
  }
}

class Advertiser {
  String name;
  String state;
  String city;

  Advertiser(this.name, this.state, this.city);
}