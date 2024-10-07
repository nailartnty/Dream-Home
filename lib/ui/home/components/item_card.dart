// item untuk mendefinisikan bagaimana sebuah objek akan terlihat, untuk menjadikan sebuah objek riusable

import 'package:floapp/consts.dart';
import 'package:floapp/models/products.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product, required this.press});

  final Product product;
  final VoidCallback press; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press, // kita ngebuat pilihan ketika kita menekan lama
      child: Column(
        children: [
          Expanded( 
            child: Container(
              padding: const EdgeInsets.all(defaultPadding), 
              decoration: BoxDecoration( // buat ngedekor 
                color: product.color,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Hero( // widget yang memungkinkan pembuatan animasi transisi halus saat berpindah antar halaman (route) atau layar dalam aplikasi.
                tag: "${product.id}", // untuk mendefinisikan prodact makanya kita panggil id
                child: Image.asset(product.image) // untuk gambarnya
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              product.title,
              style: const TextStyle(
                color: textColor
              ),
            ),
          ),
          Text(
            "\$ ${product.price}"
          )
        ],
      ),
    );
  }
}