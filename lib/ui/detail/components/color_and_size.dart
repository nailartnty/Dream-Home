import 'package:floapp/consts.dart';
import 'package:floapp/models/products.dart';
import 'package:flutter/material.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.product});

  final Product product;

  // menyimpan value yang akan kita pakai
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Color",),
              // buat pilihan warna
              Row(
                children: [
                  ColorPicker( // manggil class colordot
                    color: Color(0xFF3D82AE), 
                    isSelected: false,  // warna yang dipilih
                  ),
                  ColorPicker( 
                    color: Color(0xFFDEE7BC), 
                    isSelected: true,
                  ),
                  ColorPicker( 
                    color: Color(0xFF989493), 
                    isSelected: false, 
                  ),
                ],
              )
            ]
          ),
        ),

        Expanded(
          child: 
          // Text("Size"), // Text untuk styling tapi dia superClass
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // buat dia kekiri
            children: [
              const Text(
                "Size",
                style: TextStyle(color: textColor),
              ),
              RichText( // TextSpan untuk styling tapi dia SubClass dari RichText (Other way to showing and modifying the text)
                text: TextSpan( // lebih kompleks
                  style: const TextStyle(color: textColor),
                  children: [ // udah menyediakan list
                    TextSpan(
                      // punya nilai yang berubah-ubah 
                      // kalau flutter nyebutnya navigation, kalau android nyebutnya intent => explicit -> perpindahan secara langsung, impisit -> perpindahan dengan membawa datanya
                      text: // cara manggil data, buat final diatas
                      "${product.size} cm",
                      // tema buat text size
                      style: Theme.of(context) 
                      // method nihh!?
                      .textTheme // mengambil tema dari context (kalau kita membangun 2 tema lightmode and blackmode)
                      .titleLarge! // ukuran titlenya 
                      .copyWith(fontWeight: FontWeight.bold) 
                    )
                  ]
                ),
              ),
            ],
          )

        )
      ],
    );
  }
}

//  membuat class baru untuk menampung warna
class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, required this.color, required this.isSelected});

  // cara mendifine varible di dart
  final Color color;
  final bool isSelected;
  // final int color; boleh make ini tapi nantinya bakal terjadi missmatch

  @override
  Widget build(BuildContext context) {
    return Container( 
      margin: const EdgeInsets.only( // untuk memberi jarak luar antar warna 
      // simetrik hanya implementasikan di atas dan bawah, 
      //tapi kalau only top dan bottom, maka implementasikan di bawah left dan right maka implementasikan di samping
        top: 12, 
        right: 10
      ),

      padding: const EdgeInsets.all(1.5), // memberi jarak dalam antar warna
      width: 20, // memberi lebar warna
      height: 20, // memberi tinggi warna
      // modifikasi untuk BORDER dari ColorPickernya
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent
        )
      ),

      child: DecoratedBox( // kalau mau luas lagi pake decoratedBox (gak bisa manggil colornya langsung)
        // modifikasi untuk ColorPickernya
        decoration: BoxDecoration( // lebih spesifik dia yang menerapkan dekorasi seperti latar belakang, bayangan, atau border pada sebuah widget
          color: color,
          shape: BoxShape.circle
        )
      ),
    );
  }
}