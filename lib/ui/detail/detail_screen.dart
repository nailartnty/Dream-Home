import 'package:floapp/consts.dart';
import 'package:floapp/models/products.dart';
import 'package:floapp/ui/detail/components/add_to_cart.dart';
import 'package:floapp/ui/detail/components/cart_counter.dart';
import 'package:floapp/ui/detail/components/color_and_size.dart';
import 'package:floapp/ui/detail/components/description.dart';
import 'package:floapp/ui/detail/components/fav_button.dart';
import 'package:floapp/ui/detail/components/product_title.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});
  // kalau var di luar sini berati public tp klo di dalam itu private
  final Product product;

  @override
  Widget build(BuildContext context) {
  // varnya privat kalau didalam widget
    final Size size = MediaQuery.of(context).size; // Media Query itu kelas yang digunakan untuk membuat tata letak yang responsif di ukuran divice.
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.favorite_border_outlined)
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.shopping_cart_outlined)
          )
        ],
      ),

      body: SingleChildScrollView( //  Added SingleChildScrollView
        child: Column( // medefinisikan column
          children: <Widget>[
            SizedBox(
              height: size.height, // dia udah ada heightnya di Media Query
              child: Stack( // stack untuk numpukin widget
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.35),  // margin dari atas jadi 35% kareana kalau kita cuma ngasih height dia itu bakal ngambil 100% dari keseluruhan screen, kalau di ngambil 35% tinggi ruang screen buat backround birunya
                    padding: const EdgeInsets.only(
                      top: defaultPadding, //size.height
                      left: defaultPadding,
                      right: defaultPadding,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)
                      )
                    ),
                    child: Column(
                      children: <Widget>[ // mulai manggil komponennya
                        const SizedBox(height: defaultPadding),
                        ColorAndSize(product: product), 
                        const SizedBox(height: defaultPadding),
                        Description(product: product), // isinya descripsi product
                        const SizedBox(height: defaultPadding),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CartCounter(),
                            FavButton()
                          ],
                        ), // isinya buat counter
                        const SizedBox(height: defaultPadding),
                        AddToCart(product: product) // isinya button
                      ]
                    )
                  ),
                  // title widget placed above the image
                  Positioned( // widget yg berguna untuk mengatur letak suatu widget secara spesific ( biar makin spesifik make stack)
                    top: size.height * 0.02,
                    left: 12,
                    right: 12,
                    child: ProductTitle(product: product),
                  )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}