import 'package:flutter/material.dart';
import 'package:flutter_projects/constants/constants.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({
    Key? key,
  }) : super(key: key);


  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  int selectedIndex = 0;
  bool isSelected = false;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        setState(() {
          selectedIndex = index;
        });
      },
      currentIndex: selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        buildBottomNavigationBarItem('首页','首页', true),
        buildBottomNavigationBarItem('购物','购物', false),
        buildAddButton(),
        buildBottomNavigationBarItem('消息','消息', false),
        buildBottomNavigationBarItem('我','我', false),
      ],
    );
  }

  BottomNavigationBarItem buildAddButton() {
    return BottomNavigationBarItem(
          label: "create",
          icon: GestureDetector(
            child: SizedBox(
              height: 37,
              child: Container(
                width: 50,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red[500],
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
      );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(String labelText, String iconText, bool isSelected) {
    return BottomNavigationBarItem(
        label: labelText,
        icon: SizedBox(
          height: 25,
          child: Text(iconText,
              style: TextStyle(
                  fontWeight: isSelected? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.black87 : lightTextColor,
                  fontSize: 18
              )
          ),
        ),
      );
  }
}
