import 'package:flutter/material.dart';


class CoffeeTile extends StatelessWidget {
  const CoffeeTile({Key? key, required this.coffeeImagePath, required this.coffeeName, required this.coffeePrice}) : super(key: key);

  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.black54
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // coffee image
              Container(
                height: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(coffeeImagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),
              ),

              // coffee name
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start  ,
                  children: [
                    Text(coffeeName, style: const TextStyle(fontSize: 20),),
                    const SizedBox(height: 4,),
                    Text("With Almond Milk", style: TextStyle(color: Colors.grey[700]),),
                  ],
                ),
              ),

              // price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$$coffeePrice"),
                    Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: const Icon(Icons.add)
                    )
                  ],
                ),
              )

            ]
        ),
      ),
    );
  }
}
