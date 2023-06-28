import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:test_ecommerce/widgets/slide.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});
  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(children: [
          Slide(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Lastest Product"),
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
