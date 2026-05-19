import 'package:flutter/material.dart';

class FoodCard extends StatefulWidget {
 
  const FoodCard({super.key,});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {

  List category = [
    {"title" : "All", "image" : "images/all.png"},
    {"title" : "Burger", "image" : "images/burger.png"},
    {"title" : "Pizza", "image" : "images/pizza.png"},
    {"title" : "Dessert", "image" : "images/dessert.png"},
    {"title" : "Dessert", "image" : "images/dessert.png"},
    
  ];
  int selectedIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: category.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 6),
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == index ? Color(0xFF8366AA) : Color(0xFFD0D0D0),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: 80,
                  width: 76,
                  child: Image.asset(category[index]["image"]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  category[index]["title"],
                  style: TextStyle(color: Color(0xFF8366AA), fontSize: 18),
                ),
              ),
            ),
          ],
        );
        
      },
      
    );
  }
}
