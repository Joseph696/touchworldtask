import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/product_models.dart';

class ProductTile extends StatelessWidget {

  final ProductModel product;

  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: CachedNetworkImage(
              imageUrl: product.image!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.name!,
            maxLines: 2,
            style: const TextStyle(
                fontFamily: 'avenir', fontWeight: FontWeight.w800),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),

          const SizedBox(height: 8),
          Text('\$${product.price}',
              style: const TextStyle(fontSize: 32, fontFamily: 'avenir')),
        ],
      ),
    );
  }
}
