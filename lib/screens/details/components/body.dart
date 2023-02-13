import 'package:flutter/material.dart';
import 'package:flutter_projects/constants.dart';
import 'package:flutter_projects/models/Product.dart';
import 'package:flutter_projects/screens/details/components/add_to_cart.dart';
import 'package:flutter_projects/screens/details/components/color_and_size.dart';
import 'package:flutter_projects/screens/details/components/counter_with_fav_button.dart';
import 'package:flutter_projects/screens/details/components/description.dart';
import 'package:flutter_projects/screens/details/components/product_title_with_image.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: size.height * 0.3,
                  ),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin),
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                  child: Column(
                    children: [
                      ColorAndSize(product: product),
                      Description(product: product),
                      const SizedBox(height: kDefaultPaddin / 2,),
                      const CounterWithFavBtn(),
                      const SizedBox(height: kDefaultPaddin / 2,),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}























