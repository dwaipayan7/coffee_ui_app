import 'package:coffee_ui_app/Utils/colors.dart';
import 'package:coffee_ui_app/widgets/background.dart';
import 'package:coffee_ui_app/widgets/display_image.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../models/size_options_model.dart';
import '../widgets/size_options.dart';

class DetailPage extends StatefulWidget {
  final Product product;
  const DetailPage({
    super.key,
    required this.product,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedSize = 2;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          Center(
            child: Stack(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: Colors.amberAccent,
                ),
                Positioned(
                  right: 2,
                  top: 1,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: firstColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Stack(
        children: [
          const Background(),
          Positioned(
            left: 20,
            right: 20,
            child: Column(
              children: [
                Hero(
                  tag: widget.product.name,
                  child: SizedBox(
                    width: size.width * 0.81,
                    height: size.height * 0.5,
                    child: DisplayImage(product: widget.product),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 1.5,
                      child: Text(
                        widget.product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "\$${widget.product.price}0",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            color: firstColor,
                          ),
                        ),
                        Text(
                          "Best Sale",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Size Options",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black38,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                        List.generate(sizeOptions.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = index;
                              });
                            },
                            child: SizeOptionItem(
                              index: index,
                              selected: selectedSize == index ? true : false,
                              sizeOption: sizeOptions[index],
                            ),
                          );
                        })

                    ),

                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
