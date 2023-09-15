// ignore_for_file: file_names
import 'package:ecommerce_app/model/Product.dart';
import 'Http.dart';

class ProductRepo {
  List<Product> products = [];

  Http httpRequest = Http();
  Future<List<Product>> getData() async {
    dynamic productsAsJson = await httpRequest.getHttp();
    for (dynamic json in productsAsJson) {
      Product product = Product.fromJson(json);
      products.add(product);
    }
    return products;
  }
}
