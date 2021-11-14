import 'package:flutter/material.dart';
import 'package:productos_app/src/models/product.dart';
import 'package:productos_app/src/pages/pages.dart';
import 'package:productos_app/src/services/services.dart';
import 'package:productos_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    if (productService.isLoading) return LoadingPage();
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos App'),
      ),
      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          child: CardProducto(
            product: productService.products[index],
          ),
          onTap: () {
            productService.productSelected =
                productService.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          productService.productSelected = new Product(
            available: false,
            name: '',
            price: 0,
          );
          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}
