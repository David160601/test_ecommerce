import 'package:flutter/material.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({super.key});

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {}),
      child: Ink(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "195",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.pink,
                  )
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: Image(
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    height: 120,
                    image: NetworkImage(
                        "https://www.freepnglogos.com/uploads/shoes-png/dance-shoes-png-transparent-dance-shoes-images-5.png")),
              ),
              SizedBox(height: 10),
              Text(
                "Title",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            ]),
      ),
    );
  }
}
