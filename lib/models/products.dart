import 'package:flutter/material.dart';

class Product {
  // data model untuk menampung detail data apa aja yg dibutuhkan 
  final String image, title, description;
  final int price, size, id;
  final Color color;

// variabel final harus di inisialisasi
  Product({
    // this adlh untuk menandakan bahwa objek terkait hanya bisa diakses oleh Class yang terkait
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.size,
    required this.color,
  });
}

List<Product> product = [
  Product(
    id: 1, 
    image: "assets/images/product1.png", 
    title: "Vienna Sofa Bed", 
    description: descriptionText, 
    price: 1799, 
    size: 12, 
    color: const Color(0xFFDEE7BC)
  ),

  Product(
    id: 2, 
    image: "assets/images/image2.png", 
    title: "Heinz Kursi Makan", 
    description: descriptionText, 
    price: 899, 
    size: 12, 
    color: const Color(0xFFF7D8D2)
  ),
  Product(
    id: 3, 
    image: "assets/images/image3.png", 
    title: "Darwin Rak 3 Tingkat", 
    description: descriptionText, 
    price: 1899, 
    size: 12, 
    color: const Color(0xFFB9AE97)
  ),
  Product(
    id: 4, 
    image: "assets/images/image4.png", 
    title: "Lizzie Kursi Seater", 
    description: descriptionText, 
    price: 1599, 
    size: 12, 
    color: const Color(0xFFB99683)
  ),
  Product(
    id: 5, 
    image: "assets/images/image5.png", 
    title: "Mac Rak Buku", 
    description: descriptionText, 
    price: 399, 
    size: 12, 
    color: const Color(0xFFA1887D)
  ),
  Product(
    id: 6, 
    image: "assets/images/image6.png", 
    title: "Serena Lampu Meja", 
    description: descriptionText, 
    price: 799, 
    size: 12, 
    color: const Color(0xFF8E8E91)
  ),
];

String descriptionText = "lorem ipsum dolor sit amet, Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual.";