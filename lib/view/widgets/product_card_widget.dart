import 'package:flutter/material.dart';

import '../../model/product_model.dart';
import '../../utils/responsive.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 260,
                    child: Image.network(
                      product.image,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Responsive.width(50, context)),
          Text(
            product.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: Responsive.width(16, context),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Responsive.width(16, context)),
          Text(
            product.description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: Responsive.width(14, context),
            ),
          ),
          SizedBox(height: Responsive.width(16, context)),
          Text(
            "\$ ${product.price}",
            style: TextStyle(
              color: Colors.white,
              fontSize: Responsive.width(24, context),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
