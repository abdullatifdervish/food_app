import 'package:flutter/material.dart';
import 'package:food_app/components/ons_card.dart';
import 'package:food_app/components/cards_list.dart';
import 'package:food_app/screen/main_wrapper.dart';

class DetailsScreen extends StatefulWidget {
  final int i;
  const DetailsScreen({super.key, required this.i});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int x = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFD9378E), Color(0xFF1082C2)],
          ),
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 60),
                height: 400,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset("images/shadow.png", height: 200),
                    ),
                    Center(child: Image.asset(cards[widget.i]["image"])),
                    Positioned(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.arrow_back_ios),
                        ),
                        iconSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 491,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(60),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFF8653CE), Color(0xFF9C80C1)],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 5,
                              bottom: 5,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Text(
                                  " 4.8",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            cards[widget.i]["price"],
                            style: TextStyle(
                              fontSize: 28,
                              color: Color(0xFF8366AA),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cards[widget.i]["title"],
                          style: TextStyle(
                            fontSize: 28,
                            color: Color(0xFF8366AA),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  x++;
                                });
                              },
                              icon: Icon(
                                Icons.add_circle_outline_outlined,
                                color: Color(0xFF8D59D9),
                              ),
                            ),
                            Text("$x"),

                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (x > 0) {
                                    x--;
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.remove_circle_outline,
                                color: Color(0xFF8D59D9),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Big juicy burger with cheese, lettuce, tomato and special sauces. ",
                      style: TextStyle(color: Color(0xFF8366AA)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Add Ons",
                      style: TextStyle(
                        color: Color(0xFF8366AA),
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OnsCard(image: "images/ons1.png"),
                        OnsCard(image: "images/ons2.png"),
                        OnsCard(image: "images/ons3.png"),
                      ],
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(25),
                        ),
                        textColor: Colors.white,
                        minWidth: 350,
                        color: Color(0xFF9C58A2),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Add To Cart",
                            style: TextStyle(fontSize: 31),
                          ),
                        ),
                        onPressed: () {

                          
                          
                          bool check = globalCartItems.containsKey(widget.i);
                          if (check){
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
                          }
                          else {
                            setState(() {
                            // widget.i (o anki ürünün indeksi) sepet listesine 1 adet olarak ekleniyor
                            globalCartItems[widget.i] = x;
                          });
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

                          // Kullanıcıya eklendiğine dair küçük bir bildirim (Opsiyonel)
                          
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
