class ProductData {
  final int id;
  final String productName;
  final String category;
  final String imageUrl;
  final int value;
  final int rentTime;
  final String description;
  final bool isActive;
  final bool isLent;
  final Advertiser advertiser;

  const ProductData({
    required this.id,
    required this.productName,
    required this.category,
    required this.imageUrl,
    required this.value,
    required this.rentTime,
    required this.description,
    required this.isActive,
    required this.isLent,
    required this.advertiser,
  });

  //TODO ver o .fromJson(json) do advertiser
  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'] as int,
      productName: json['name'] as String,
      category: json['category'] as String,
      imageUrl: json['albumId'] as String,
      value: json['price'] as int,
      rentTime: json['timeQuantity'] as int,
      description: json['description'] as String,
      isActive: json['isActive'] as bool,
      isLent: json['isLent'] as bool,
      advertiser: json['owner'] as Advertiser,
    );
  }
}

class Advertiser {
  final int id;
  final String name;
  final String fullName;
  final String lastName;
  final String address;
  final String state;
  final String city;

  const Advertiser(
      {required this.id,
      required this.name,
      required this.fullName,
      required this.lastName,
      required this.address,
      required this.state,
      required this.city});

  factory Advertiser.fromJson(Map<String, dynamic> json) {
    return Advertiser(
      id: json['id'] as int,
      name: json['firstName'] as String,
      fullName: json['fullName'] as String,
      lastName: json['lastName'] as String,
      address: json['address'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
    );
  }
}