import 'package:flutter/material.dart';
import 'package:flutter_projects/constants.dart';
import 'package:flutter_projects/models/Product.dart';
import 'package:flutter_projects/screens/details/components/body.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have different color
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: Body(product: product,),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: SvgPicture.asset("assets/icons/back.svg", color: Colors.white,),
      ),
      actions: [
        IconButton(
          // Default color is white
            onPressed: (){},
            icon: SvgPicture.asset("assets/icons/search.svg",)
        ),
        IconButton(
          // Default color is white
            onPressed: (){},
            icon: SvgPicture.asset("assets/icons/cart.svg",)
        ),
        const SizedBox(width: kDefaultPaddin / 2,)
      ],
    );
  }
}
