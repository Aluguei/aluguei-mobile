import 'package:aluguei/ui/home/product/productData.dart';

import 'api/products/productsApi.dart';
import 'models/products/productModel.dart';

class ProductsRepository {
  ProductApi service = ProductApi();

  Future<List<ProductData>> getAvailableProducts() async {
    return await service.getAvailableProducts();
  }

  Future<void> getMyProducts() async {
    await service.getMyProducts();
  }

  Future<void> getRentedProducts() async {
    await service.getRentedProducts();
  }

  Future<void> registerProduct(ProductModel model) async {
    await service.registerProduct(model);
  }

  Future<void> editProduct(int id, ProductModel model) async {
    await service.editProduct(id, model);
  }

  Future<void> deleteProduct(int id) async {
    await service.deleteProduct(id);
  }

  Future<void> rentProduct(int id) async {
    await service.rentProduct(id);
  }
}
