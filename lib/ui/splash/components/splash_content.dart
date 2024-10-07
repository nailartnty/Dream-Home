import 'package:floapp/consts.dart';
import 'package:floapp/size_config.dart';
import 'package:flutter/material.dart';

// buat manggil splash content
class SplashContent extends StatelessWidget {
  const SplashContent({
    // ctrl + . + enter apabila udah step buat var data
    super.key, required this.text, required this.image,
  });

  // blank var data
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(), // biar dia kebawah
        Text(
          "Finditior",
          style: TextStyle(
            color: primaryColor,
            fontSize: getProportionateScreenW(36.0), 
            ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Image.asset(image)
      ],
    );
  }
}
//2006