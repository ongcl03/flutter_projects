import 'package:flutter/material.dart';
import 'package:flutter_projects/constants/constants.dart';

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List categoryList = ["推荐", "视频", "直播", "学习", "职场", "汽车", "编程"];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                      child: Text(
                        categoryList[index],
                        style: TextStyle(
                            fontSize: 16.5,
                            color: selectedIndex == index ? Colors.black87 : lightTextColor
                        ),
                      ),
                    ),
                  );
                }),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_down, color: textColor, size: 27,))
        ],
      ),
    );
  }
}
