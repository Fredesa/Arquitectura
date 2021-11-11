import 'package:flutter/material.dart';
import 'package:productos_app/src/models/models.dart';

class CardProducto extends StatelessWidget {
  final Product product;

  const CardProducto({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(product.picture),
            _ProductoDetails(
              nombreProducto: product.name,
              idProducto: product.id!,
            ),
            Positioned(
              top: 0,
              right: 0,
              child: _PriceTag(product.price),
            ),
            if (product.available)
              Positioned(top: 0, left: 0, child: _Available()),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 7),
          blurRadius: 10,
        )
      ],
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final String? url;
  const _BackgroundImage(this.url);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: url == null
            ? Image(image: AssetImage('assets/no-image.png'))
            : FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(url!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class _ProductoDetails extends StatelessWidget {
  final String nombreProducto;
  final String idProducto;

  const _ProductoDetails(
      {required this.nombreProducto, required this.idProducto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration:
            _buildBoxDecoration(), //Escribimos BoxDecoration y con ctrl + punto lo extract method _buildBoxDecoration ??? no funcionรณ mejor manualmente
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //alinea horizontalmente
          children: [
            Text(
              nombreProducto,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              idProducto,
              style: TextStyle(fontSize: 15, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}

class _PriceTag extends StatelessWidget {
  final double price;

  const _PriceTag(this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        // Envolvemos el Padding en un FittedBox para que se adapte al espacio.
        fit: BoxFit.contain,
        child: Padding(
            // Envolvemos el Text en un pading para la alineaciรณn.
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(
              '\$$price',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
    );
  }
}

class _Available extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        // Envolvemos el Padding en un FittedBox para que se adapte al espacio.
        fit: BoxFit.contain,
        child: Padding(
            // Envolvemos el Text en un pading para la alineaciรณn.
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(
              'Disponible',
              style: TextStyle(color: Colors.black, fontSize: 20),
            )),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
    );
  }
}
