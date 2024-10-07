import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView( // kita nge costum sendiri scroll viewnya mau kayak gimana
            scrollDirection: Axis.horizontal,
            slivers: [ // bawaan dari flutternya, sesuatu yang dapat discroll a/ yg bisa berguna
              SliverToBoxAdapter( // mengubah sesuatu yang biasa menjadi luar biasa ()
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.amber,
                    ),
                  )),
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.pink,
                    ),
                  )),
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Center(
                    child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  ),
                ),
              ),
              
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Center(
                  child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Center(
                  child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.indigo,
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Center(
                  child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.indigo,
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}