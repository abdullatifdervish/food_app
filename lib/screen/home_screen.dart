import 'package:flutter/material.dart';
import 'package:food_app/components/food_type_card.dart';
import 'package:food_app/components/popular_card.dart';
import 'package:food_app/components/promotions_card.dart';
import 'package:food_app/screen/details_screen.dart';
import 'package:food_app/components/cards_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " Menu",
                  style: TextStyle(
                    color: Color(0xFF8366AA),
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(30),
                  child: Image.asset(
                    "images/my_foto.jpeg",
                    height: 56,
                    width: 56,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                fillColor: Color(0xFFD1D1D1),

                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
              ),
            ),
            SizedBox(height: 25),
            SizedBox(height: 125, child: FoodCard()),

            Text(
              " Promotions",
              style: TextStyle(fontSize: 25, color: Color(0xFF8366AA)),
            ),
            SizedBox(height: 10),
            PromotionsCard(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                " Popular",
                style: TextStyle(fontSize: 25, color: Color(0xFF8366AA)),
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(i : index)));
                      },
                      child: PopularCard(
                        indexx: index,
                        title: cards[index]["title"],
                        image: cards[index]["image"],
                        price: cards[index]["price"],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
          
        ),
      ),
    );
  }
}
