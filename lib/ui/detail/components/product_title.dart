import 'package:floapp/models/products.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.product});

  final Product product;
  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // buat mendefinisikan ukuran proposional gambar sebagai variable const
    const double imageWidthRatio = 0.42; // 60% dari ukuran lebar layar
    // const double imageHeigtRatio = 0.28; // ngambil 28% dari ukuran tinggi layar

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12), 
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Future Lazzie Chair",
              style: TextStyle(color: Colors.white),
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              product.title,
              style: const TextStyle(
                fontSize: 20, 
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          const SizedBox(height: 90),

          Row(
            children: [
              Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Price",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              
                  Text(
                    "\$ ${product.price}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 90), // ngasih jarak antara 

              Hero( // widget yang memungkinkan pembuatan animasi transisi halus saat berpindah antar halaman (route) atau layar dalam aplikasi.
                tag: "${product.id}", // untuk mendefinisikan product makanya kita panggil id
                child: Image.asset( 
                  product.image, // manggil imagenya
                  width: size.width * imageWidthRatio, // buat ngefixin kita ngasih ratio lebar gambar dari Media Query
                  // height: size.height * imageHeigtRatio, // buat ngefixin kita ngasih ratio tinggi gambar dari Media Query
                  fit: BoxFit.fill, //yang akan me-resize gambar agar sesuai dengan ukuran container, meskipun itu bisa merubah aspect ratio gambar
                )
              )
            ],
          )
        ],
      ),
    );
  }
}