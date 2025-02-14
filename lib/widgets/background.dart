import 'package:coffee_ui_app/widgets/coffee_bean.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          CoffeeBean(degree: 190, right: 160, top: 90),
          CoffeeBean(degree: 90, left: -50, top: 5),
          CoffeeBean(degree: 10, left: -70, top: 140),
          CoffeeBean(degree: 75, right: -20, top: 150),
          CoffeeBean(degree: 100, right: -70, top: 300),
          CoffeeBean(degree: 155, right: 70, top: 350),
        ],
      ),
    );
  }
}
