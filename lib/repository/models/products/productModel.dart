class ProductModel {
  String name;
  String description;
  String category;
  double price;
  String timeUnit;
  int timeQuantity;

  ProductModel(this.name, this.description, this.category, this.price,
      this.timeUnit, this.timeQuantity);

  //TODO adicionar categoria
  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'description': description,
        'category': category,
        'price': price.toDouble(),
        'timeUnit': timeUnit,
        'timeQuantity': timeQuantity.toInt()
      };

  @override
  String toString() {
    return 'Product{name: $name, description: $description, category: $category, price: $price, timeUnit: $timeUnit, timeQuantity: $timeQuantity}';
  }
}