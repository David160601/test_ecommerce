import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_ecommerce/screens/all_product_page.dart';
import 'package:test_ecommerce/screens/model.dart';
import 'package:test_ecommerce/widgets/home_product.dart';
import 'package:test_ecommerce/widgets/slide.dart';
import 'package:page_transition/page_transition.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});
  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  List<Product> lastestProducts = [];
  Future<void> getProducts() async {
    var response = await Dio()
        .get("https://api.escuelajs.co/api/v1/products/?offset=0&limit=10");
    if (response.statusCode == 200) {
      List<Product> products = [];
      var count = 0;
      for (var json in response.data) {
        count++;
        products.add(Product.fromJson(json));
      }
      print(count);
      setState(() {
        lastestProducts = products;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(children: [
          const Slide(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Lastest Product",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: AllProductPage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_right,
                    size: 40,
                    color: Colors.pink,
                  ))
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lastestProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.9),
            itemBuilder: (context, index) {
              return HomeProduct(
                id: lastestProducts[index].id,
                images: lastestProducts[index].images,
                title: lastestProducts[index].title,
                price: lastestProducts[index].price,
              );
            },
          )
        ]),
      ),
    );
  }
}
