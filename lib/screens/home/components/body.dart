import 'package:flutter/material.dart';
import 'package:flutter_projects/constants.dart';
import 'package:flutter_projects/models/Product.dart';
import 'package:flutter_projects/screens/details/details_screen.dart';
import 'package:flutter_projects/screens/home/components/categories.dart';
import 'package:flutter_projects/screens/home/components/item_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Categories(),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: kDefaultPaddin,
                      crossAxisSpacing: kDefaultPaddin
                  ),
                  itemBuilder: (context, index) => ItemCard(
                    product: products[index],
                    press: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(product: products[index])));
                      },
                  )
              ),
            ))
      ],
    );
  }
}

