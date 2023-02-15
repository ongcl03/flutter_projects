import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  const CoffeeType({Key? key, required this.coffeeType, required this.isSelected, required this.onTap}) : super(key: key);

  final String coffeeType;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          coffeeType,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.orange : Colors.grey[700]
          ),
        ),
      ),
    );
  }
}
