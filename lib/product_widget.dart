import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wac2_flutter/product_model.dart';

class ProductItem extends StatelessWidget {
  Product product;
  ProductItem(this.product);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Colors.grey.withOpacity(0.2),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            child: CachedNetworkImage(
              imageUrl: product.imageUrl,
              fit: BoxFit.cover,
              placeholder: (c, y) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name),
              Text(product.description),
              Text(product.price.toString()),
            ],
          )
        ],
      ),
    );
  }
}
