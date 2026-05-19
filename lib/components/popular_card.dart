import 'package:flutter/material.dart';
import 'package:food_app/screen/main_wrapper.dart';

class PopularCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final int indexx;
  const PopularCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.indexx,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 236,
          width: 168,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              begin: AlignmentGeometry.centerLeft,
              end: AlignmentGeometry.centerRight,
              colors: [Color(0xFF8566AE), Color(0xFFB883FF)],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(image),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(title, style: TextStyle(color: Colors.white)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ $price",
                          style: TextStyle(color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            // globalCartItems[indexx] = 1;
                            bool check = globalCartItems.containsKey(indexx);
                            if (check) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Color(0xFF8366AA),
                                  content: Text(
                                    'This product is already in your cart!',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            } else {
                              // widget.i (o anki ürünün indeksi) sepet listesine 1 adet olarak ekleniyor
                              globalCartItems[indexx] = 1;

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Color(0xFF8366AA),
                                  content: Text(
                                    'Product added to cart!',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                          },
                          icon: Icon(Icons.add_circle_outline_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
