import 'package:flutter/material.dart';

class OnsCard extends StatefulWidget {
  final String image;
  const OnsCard({super.key, required this.image});

  @override
  State<OnsCard> createState() => _OnsCardState();
}

class _OnsCardState extends State<OnsCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Image.asset(widget.image),
        ),
        Positioned(
          top: 55,
          left: 45,
          bottom: 10,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_circle_outline, color: Color(0xFF8366AA)),
          ),
        ),
      ],
    );
  }
}
