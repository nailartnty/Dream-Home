import 'package:flutter/material.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Add your logic here
        
      }, 
      icon: const Icon(Icons.favorite_border)
    );
  }
}