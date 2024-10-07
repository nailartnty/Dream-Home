import 'package:floapp/consts.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

int numOfItem = 1; // kita buat var // kalau kita masukin zero dia gak bakal relavan kalau kita masukin ke setstate dibawah jadi minimal itu 1

class _CartCounterState extends State<CartCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget> // Generic Style (bakal dikasih tau, ini tuh isinya widget2)
      [
        OutlinedButton(
          // kondisi buat logikanya
          onPressed: () {
            setState(() { // perubahan state
              if (numOfItem > 1) { // jika varnya lebih dari 1 maka panggil perubahannya lagi lalu kurang 1
                setState(() {
                  numOfItem--; //  kurangi 1
                });
              }
            });
          },
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,  // kepake kalau misal kita udah ad widgetnya // kasih Zero aja walau gak ada nilainya
            minimumSize: const Size(35, 35),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ), 

          // buat stylenya
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: defaultPadding,), // setting jaraknya
        Padding( // paddingnya
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding), // paddingnya kesamping nih
          child: Text(
            numOfItem.toString().padLeft(2, "0"), // mau ngebuat counternya jadi 2 digit soalnya 
            style: const TextStyle(
              fontSize: 18, //  ukuran fontnya
              color: textColor // set warna
            ),
          )
        ), 
        const SizedBox(width: defaultPadding,),
        OutlinedButton(
          onPressed: () {
            setState(() { // perubahan state
              numOfItem++; // tambah 1
            });
          },
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero, // kepake kalau misal kita udah ad widgetnya 
            minimumSize: const Size(35, 35), // ukuran  buttonnya counternya
            shape: RoundedRectangleBorder( // sama kayak kita bikin border radius di website
              borderRadius: BorderRadius.circular(10) 
            )
          ),
          child: const Icon(Icons.add)
        ),
      ],
    );
  }
}


