import 'package:flutter/material.dart';
import 'package:flutter_projects/pages/models/post.dart';


class GridViewPosts extends StatelessWidget {
  const GridViewPosts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: GridView.builder(
            itemCount: postList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (1 / 1.66),
                mainAxisSpacing: 3,
                crossAxisSpacing: 3),
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                  AssetImage(postList[index].image),
                                  fit: BoxFit.fitWidth)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8.8),
                        child: Text(
                          postList[index].description,
                          style: const TextStyle(letterSpacing: 2.2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.8, right: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(postList[index].profileImage),
                                  maxRadius: 9.5,
                                ),
                                const SizedBox(width: 10,),
                                Text(
                                  postList[index].author,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF636363)
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 40,
                                  child: Image.asset("assets/icons/heart.png", color: const Color(0xFF636363),),
                                ),
                                Text(postList[index].likeNumber, style: const TextStyle(
                                    fontSize: 13.7,
                                    color: Color(0xFF636363)
                                ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ));
            }),
      ),
    );
  }
}

