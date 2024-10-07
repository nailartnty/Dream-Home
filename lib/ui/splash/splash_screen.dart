import 'package:floapp/size_config.dart';
import 'package:floapp/ui/splash/components/body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // we have to call this in our starting screen
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}