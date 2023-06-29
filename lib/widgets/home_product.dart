import 'package:flutter/material.dart';

class HomeProduct extends StatefulWidget {
  String? title;
  int? id;
  List<String>? images;
  int? price;
  HomeProduct({super.key, this.title, this.id, this.images, this.price});
  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {}),
      child: Ink(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        widget.price.toString() ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                      const Icon(
                        Icons.star,
                        color: Colors.pink,
                      )
                    ],
                  )),
              const SizedBox(height: 10),
              Flexible(
                  flex: 2,
                  child: Center(
                    child: Image(
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        height: 120,
                        image: NetworkImage(widget.images?.first ?? "")),
                  )),
              const SizedBox(height: 10),
              Flexible(
                  flex: 1,
                  child: Text(
                    widget.title ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ))
            ]),
      ),
    );
  }
}
