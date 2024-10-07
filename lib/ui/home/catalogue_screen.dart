import 'package:floapp/consts.dart';
import 'package:floapp/models/products.dart';
import 'package:floapp/ui/detail/detail_screen.dart';
import 'package:floapp/ui/home/components/categories.dart';
import 'package:floapp/ui/home/components/item_card.dart';
import 'package:flutter/material.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // itu yang atas
      automaticallyImplyLeading: false, 
        backgroundColor: Colors.white,
        elevation: 0, // untuk menghilangkan efek bayangan
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.search)
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.shopping_cart_outlined)
          )
        ],
      ),

      body: Column(
        // text titlenya
        crossAxisAlignment: CrossAxisAlignment.start, // biar dia melawan arah sama default valuenya
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "Future Furniture",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              )
            ),
          ),
          const Categories(), // buat manggil data list view
          Expanded(
            // mainAxis bakal ngikutin parentnya terus
            // crossAxis berlawanan arah
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:  defaultPadding),
              child: GridView.builder( // nampilin list di dengan berbentuk coloum dan list 
                // datanya diambil dari product
                itemCount: product.length, // length
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( // membungkus widget biasa biar dia bisa di tempatkan di custom scrollview, dia itu lebih banyak opsi dari sliver //  gridDeleged mengatur tata letak 
                  crossAxisCount: 2, // Jumlah kolom dalam grid
                  crossAxisSpacing: defaultPadding, // Jarak antar kolom (horizontal)
                  mainAxisSpacing: defaultPadding, // Jarak antar baris (vertikal)
                  childAspectRatio: 0.75 // Rasio aspek dari setiap elemen grid a/ perbandingan tinggi dan lebar item
                ),
              
                
                itemBuilder: (context, index) =>  ItemCard(
                  product: product[index], 
                  // ketika user  mengklik item card, maka akan diarahkan ke halaman detail produk
                  press: () =>  Navigator.push(
                    context,
                    // pindah screen
                    MaterialPageRoute(builder: (context) => DetailScreen(product: product[index])) // pake index soalnya di make nya list di model product 
                    )
              
                  ), 
              
                ),
            )
            )
        ],
      ),
    );
  }
}