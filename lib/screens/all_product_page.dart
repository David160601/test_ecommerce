import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_ecommerce/screens/model.dart';
import 'package:test_ecommerce/widgets/home_product.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({super.key});

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  List<Product> allProducts = [];
  Future<void> getAllProducts() async {
    var response = await Dio().get("https://api.escuelajs.co/api/v1/products");
    if (response.statusCode == 200) {
      List<Product> products = [];
      for (var element in response.data) {
        products.add(Product.fromJson(element));
      }
      setState(() {
        allProducts = products;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.pink, //change your color here
        ),
        title: const Text(
          "All Products",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 15),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.9),
          itemBuilder: (context, index) {
            return HomeProduct(
              id: allProducts[index].id,
              images: allProducts[index].images,
              title: allProducts[index].title,
              price: allProducts[index].price,
            );
          },
        ),
      ),
    ));
  }
}
