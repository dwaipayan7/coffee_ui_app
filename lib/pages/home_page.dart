import 'package:coffee_ui_app/models/product_model.dart';
import 'package:coffee_ui_app/widgets/background.dart';
import 'package:coffee_ui_app/widgets/category_items.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Stack(
        children: [
          Background(),
          Positioned(
            top: 30,
            left: 40,
            child: Text(
              "Smooth Out\nYour Everyday",
              style: TextStyle(
                  fontWeight: FontWeight.w900, fontSize: 35, height: 1.2),
            ),
          ),
          Positioned(
            top: 120,
            child: ClipPath(
              clipper: Clip(),
              child: Container(
                height: 190,
                width: MediaQuery.of(context).size.width,
                color: firstColor,
                child: Row(
                  children: List.generate(
                      categories.length,
                      (index) => Container(
                            height: 190,
                            width: 105,
                            color: currentCategory == index
                                ? Colors.amber
                                : Colors.transparent,
                          )).toList(),
                ),
              ),
            ),
          ),

          Positioned(
            top: 125,
            child: ClipPath(
              clipper: Clip(),
              child: Container(
                height: 280,
                width: MediaQuery.of(context).size.width,
                color: firstColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(categories.length,
                          (index) {
                    int decrease = 0;
                    int max = 1;
                    int bottomPadding = 1;

                    for(var i = 0; i<categories.length; i++){
                      bottomPadding = index > max ? index - decrease++ : index;
                    }

                    return GestureDetector(
                      onTap: (){},
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: bottomPadding.abs() * 75,
                        ),
                        child: CategoryItems(category: categories[index]),
                      ),
                    );

                  },),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}

AppBar appBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Row(
      children: [
        Image.asset(
          "images/coffee-cup.png",
          height: 30,
          color: Colors.amber,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dwaipayan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              "Space",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        )
      ],
    ),
    actions: [
      Center(
        child: Stack(
          children: [
            Icon(
              Icons.shopping_cart,
              color: Colors.amber,
            ),
            Positioned(
              right: 3,
              top: 0,
              child: Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: firstColor,
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        width: 15,
      ),
    ],
  );
}

class Clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 100);
    path.quadraticBezierTo(size.width / 2, -40, 0, 100);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
