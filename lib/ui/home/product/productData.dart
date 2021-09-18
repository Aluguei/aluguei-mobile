class ProductData {
  int id;
  String productName;
  String category;
  String imageUrl;
  String value;
  String rentTime;
  String description;
  Advertiser advertiser;

  ProductData (
      this.id,
      this.productName,
      this.category,
      this.imageUrl,
      this.value,
      this.rentTime,
      this.description,
      this.advertiser
      );
}

class Advertiser {
  String name;
  String state;
  String city;

  Advertiser(
      this.name,
      this.state,
      this.city
      );
}