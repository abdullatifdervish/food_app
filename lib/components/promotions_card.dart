import 'package:flutter/material.dart';

class PromotionsCard extends StatelessWidget {
  const PromotionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              begin: AlignmentGeometry.centerLeft,
              end: AlignmentGeometry.centerRight,
              colors: [Color(0xFF8566AE), Color(0xFFB883FF)],
            ),
          ),
          width: double.infinity,
          height: 153,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's Offer",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  "Free Box Of Fries",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 5),
                Text(
                  "on all orders above \$ 20",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 240,
          top: -40,
          child: Image.asset("images/potatoes.png"),
        ),
      ],
    );
  }
}