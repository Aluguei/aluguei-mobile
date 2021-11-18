import 'package:aluguei/ui/home/product/productData.dart';
import 'package:aluguei/ui/home/product/rentedProductData.dart';

import 'api/products/productsApi.dart';
import 'models/products/productModel.dart';

class ProductsRepository {
  ProductApi service = ProductApi();

  Future<List<ProductData>> getAvailableProducts() async {
    return await service.getAvailableProducts();
  }

  Future<List<ProductData>> searchProduct(String searchString) async {
    return await service.searchProduct(searchString);
  }

  Future<List<RentedProductData>> getMyProducts() async {
    return await service.getMyProducts();
  }

  Future<List<RentedProductData>> getRentedProducts() async {
    return await service.getRentedProducts();
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
