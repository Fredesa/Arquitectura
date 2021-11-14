import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:productos_app/src/models/models.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'productos-app-21f36-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  late Product productSelected;
  bool isLoading = true;
  bool isSaving = false;

  ProductService() {
    this.loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'products.json');
    final respuesta = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(respuesta.body);

    productsMap.forEach((key, value) {
      final productTemp = Product.fromMap(value);
      productTemp.id = key;
      this.products.add(productTemp);
    });
    isLoading = false;
    notifyListeners();
    return products;
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();
    if (product.id != null) {
      await this.updateProduct(product);
    } else {
      await this.createProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final respuesta = await http.put(url, body: product.toJson());
    final decoData = respuesta.body;
    print(decoData);
    final index =
        this.products.indexWhere((element) => element.id == product.id);
    this.products[index] = product;
    return product.id!;
  }

  Future<String> createProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final respuesta = await http.post(url, body: product.toJson());
    final decoData = json.decode(respuesta.body);
    print(decoData);
    product.id = decoData['name'];
    this.products.add(product);
    return product.id!;
  }
}
