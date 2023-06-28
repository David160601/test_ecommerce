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
    return SingleChildScrollView(
      child: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              Container(
                child: Text(
                  "hello world",
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Container(
                child: Text(
                  "hello world",
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Container(
                child: Text(
                  "hello world",
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Container(
                child: Text(
                  "hello world",
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Container(
                child: Text(
                  "hello world",
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Container(
                child: Text(
                  "hello world",
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Container(
                child: Text(
                  "hello world",
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Container(
                child: Text(
                  "hello world",
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Container(
                child: Text(
                  "hello world",
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Container(
                child: Text(
                  "hello world",
                  style: TextStyle(fontSize: 50),
                ),
              )
            ],
          ))
        ],
      ),
    );
    ;
  }
}
