import 'package:floapp/consts.dart';
import 'package:floapp/models/products.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding), // biar dia kebawah
      child: Text(
        product.description,
        style: const TextStyle(
          height: 1.5 // untuk letter spacing jarak untuk paragraf
        ),
      ),
    );
  }
}