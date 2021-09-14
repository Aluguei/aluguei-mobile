class ProductModel {
  String name;
  String description;
  String category;
  int price;
  int timeUnit;
  String timeQuantity;

  ProductModel(this.name, this.description, this.category, this.price,
      this.timeUnit, this.timeQuantity);

  @override
  String toString() {
    return 'Product{name: $name, description: $description, category: $category, price: $price, timeUnit: $timeUnit, timeQuantity: $timeQuantity}';
  }
}