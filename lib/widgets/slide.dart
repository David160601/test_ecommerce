import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class Slide extends StatelessWidget {
  
  const Slide({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Swiper(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 255, 195, 215),
            ),
            child: Row(
              children: [
                Flexible(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 223, 101, 142),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Get the special discount",
                          style: TextStyle(color: Colors.white),
                        ),
                        Flexible(
                            child: Text(
                          "50 % OFF",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ))
                      ]),
                )),
                Flexible(
                  flex: 2,
                  child: Center(
                    child: const Image(
                        fit: BoxFit.cover,
                        height: 100,
                        image: NetworkImage(
                            "https://www.freepnglogos.com/uploads/shoes-png/dance-shoes-png-transparent-dance-shoes-images-5.png")),
                  ),
                )
              ],
            ),
          );
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: true,
        itemCount: 5,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );
  }
}
