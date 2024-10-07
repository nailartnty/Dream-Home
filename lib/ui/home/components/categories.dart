import 'package:floapp/consts.dart';
import 'package:flutter/material.dart';

// untuk menyimpan data yang disuperf sama super class
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // dasar pengambilan data dari API 
  List<String> categories = [ // list yg isinya data2
    "furniture",
    "cabinets",
    "bedroom",
    "lighting",
  ];
  int selectedIndex = 0; // untukngasih tau indexnya itu dimulai dari 0

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding), // dibuat list / kebawah
      child: SizedBox( // spasi
        height: 25,
        child: ListView.builder( // viewpager sebutan biasanya // karena dia tipe datanya list
        // kita butuh builder agar bisa menampilkan data yang banyak
        scrollDirection: Axis.horizontal, // ngebuat dia bisa discroll secara horizontal a/ kesamping
          itemCount: categories.length,  // berapa item yang akan ditampilkan 
          itemBuilder: (context, index) => _buildCategory(index) // untuk menampung data yang akan ditampilkan dilayar
          ),
      )
    );
  }

  GestureDetector _buildCategory(int index) { // buat medetectif gestur (biar si pen ini bisa berguna)
    return GestureDetector( // Class yg menghandle bagaimana aplikasi merespons interaksi pengguna.
        onTap: () { 
          // initial state METHOD for stateful behaviour
          setState(() {   // buat nampilin perubahan
            selectedIndex = index;  // buat screen aktif
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // INDEX ITU SCREEN YG AKTIF
                  color: selectedIndex == index ? primaryColor : secondaryColor
                ),
              ),
              Container( // untuk menampilkan garis bawah 
                margin: const EdgeInsets.only(top: 2), //defaultPadding / 5 
                height: 2,
                width: 30,
                color: selectedIndex == index ? primaryColor : secondaryColor,
              ) 
            ],
          ),
        ),
      );
  }
}