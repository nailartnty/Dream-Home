import 'package:floapp/consts.dart';
import 'package:floapp/models/products.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding), // jaraknya kebawah
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: defaultPadding),
            height: 54,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: product.color,
              )
            ),
            child: IconButton(
              onPressed: () {

              }, 
              icon: const Icon(Icons.shopping_cart_outlined)
              )
          ),

          Expanded(
            child: ElevatedButton(
              onPressed: () {}, 
              style: ElevatedButton.styleFrom(
                backgroundColor: product.color,
                maximumSize: const Size.fromHeight(50), // biar dia setting ukurannya jadi 50
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                )
              ),
              child: const Text(
                "BUY NOW KUY",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ) 
          ),
          )
        ],
      ),
    );
  }
}