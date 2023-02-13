import 'package:flutter/material.dart';
import 'package:flutter_projects/constants.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {

  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlinedButton(Icons.remove, (){
          if(numOfItems > 1){
            setState(() {
              numOfItems--;
            });
          }
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            // if our item is less than 10, it shows 01 02 03 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,),
        ),
        buildOutlinedButton(Icons.add, (){
          setState(() {
            numOfItems++;
          });
        })
      ],
    );
  }

  SizedBox buildOutlinedButton(IconData icon, Function() press) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13)
            ),
            padding: const EdgeInsets.all(0)
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}