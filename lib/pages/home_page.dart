import 'package:flutter/material.dart';
import 'package:flutter_projects/util/coffee_tile.dart';
import 'package:flutter_projects/util/coffee_type.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int bottomNavigationBarIndex = 0;

  // List of coffee types
  final List coffeeType = [
    // [coffeeType, isSelected]
    ["Cappuccino", true],
    ["Espresso", false],
    ["Latte", false],
    ["Black", false],
    ["Tea", false],
  ];

  // user tapped on coffee types
  void coffeeTypeSelected(int index){
    setState(() {

      // this for loop makes every selection false
      for(int i=0; i<coffeeType.length; i++){
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.menu),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 18.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              bottomNavigationBarIndex = index;
            });
          },
          selectedItemColor: Colors.orange,
          currentIndex: bottomNavigationBarIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home,), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
          ],
        ),
        body: Column(
          children: [
            // Find the best coffee for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Find the best coffee for you",
                style: GoogleFonts.bebasNeue(
                  fontSize: 56
                ),
              ),
            ),
            const SizedBox(height: 25,),

            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration:  InputDecoration(
                  prefixIcon: const Icon(Icons.search,),
                  hintText: 'Find your coffee...',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade600
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade600
                    )
                  )
                ),
              ),
            ),

            const SizedBox(height: 25,),

            // horizontal listview of coffee types
            Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeType.length,
                  itemBuilder: (context, index){
                    return CoffeeType(
                        coffeeType: coffeeType[index][0],
                        isSelected: coffeeType[index][1],
                        onTap: (){
                          coffeeTypeSelected(index);
                        }
                    );
                  }
              )
            ),

            // Horizontal listview of coffee tiles
            Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CoffeeTile(
                        coffeeImagePath: "assets/images/latte.jpg",
                        coffeeName: "Latte",
                        coffeePrice: "4.20"
                    ),
                    CoffeeTile(
                        coffeeImagePath: "assets/images/coffee.jpg",
                        coffeeName: "Cappuccino",
                        coffeePrice: "4.10"
                    ),
                    CoffeeTile(
                        coffeeImagePath: "assets/images/milk.jpg",
                        coffeeName: "Milk",
                        coffeePrice: "3.80"
                    ),
                  ],
                )
            )
          ],
        ));
  }
}







