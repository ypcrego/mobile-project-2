import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getProducts();
}

class ProductRepository implements IProductRepository {
  final http.Client client;

  ProductRepository({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<List<Product>> getProducts() async {
    final response = await client.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;

      return data
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
    .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
