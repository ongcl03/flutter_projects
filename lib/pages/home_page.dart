import 'package:flutter/material.dart';
import 'package:flutter_projects/models/article_model.dart';
import 'package:flutter_projects/widgets/bottom_nav_bar.dart';
import 'package:flutter_projects/widgets/custom_tag.dart';

import '../widgets/image_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    // Save article as the a variable
    Article article = Article.articles[0];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _NewsOfTheDay(article: article)
        ],
      ),
    );
  }
}

class _NewsOfTheDay extends StatelessWidget {
  const _NewsOfTheDay({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      imageUrl: article.imageUrl,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // News of the day tag
          CustomTag(
              backgroundColor: Colors.grey.withAlpha(150),
              children: [
                Text(
                  "News of the day",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              ]),

          const SizedBox(
            height: 10,
          ),

          // The News headline text
          Text(article.title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1.25)),

          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: const EdgeInsets.only(left: 3)),
              child: Row(
                children: [
                  Text("Learn More",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white)),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
