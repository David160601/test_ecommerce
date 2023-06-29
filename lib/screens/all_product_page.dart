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
  Future<List<Product>> getAllProducts() async {
    var response = await Dio().get("https://api.escuelajs.co/api/v1/products");
    List<Product> products = [];
    if (response.statusCode == 200) {
      print(response.data.length);
      for (var element in response.data) {
        products.add(Product.fromJson(element));
      }
      return products;
    } else {
      throw ("failed to fetch product");
    }
  }

  @override
  void initState() {
    super.initState();
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
        child: FutureBuilder<List<Product>>(
            future: getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Error occur"),
                );
              } else if (snapshot.data == null) {
                return const Center(
                  child: Text("No data"),
                );
              } else {
                return GridView.builder(
                  itemCount: snapshot.data?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.9),
                  itemBuilder: (context, index) {
                    return HomeProduct(
                      id: snapshot.data?[index].id,
                      images: snapshot.data?[index].images,
                      title: snapshot.data?[index].title,
                      price: snapshot.data?[index].price,
                    );
                  },
                );
              }
            }),
      ),
    ));
  }
}
