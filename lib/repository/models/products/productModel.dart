class ProductModel {
  String name;
  String description;
  String category;
  double price;
  int timeUnit;
  String timeQuantity;

  ProductModel(this.name, this.description, this.category, this.price,
      this.timeUnit, this.timeQuantity);

  //TODO adicionar categoria
  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'description': description,
        'category': 'teste',
        'price': price,
        'timeUnit': timeUnit.toInt(),
        'timeQuantity': timeQuantity
      };

  @override
  String toString() {
    return 'Product{name: $name, description: $description, category: $category, price: $price, timeUnit: $timeUnit, timeQuantity: $timeQuantity}';
  }
}