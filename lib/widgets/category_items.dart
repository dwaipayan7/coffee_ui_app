import 'package:coffee_ui_app/models/product_model.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  final Category category;
  const CategoryItems({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 75,
          width: 75,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Image.asset("images/${category.image}"),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          category.name.toLowerCase(),
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 13,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
