import 'package:flutter/material.dart';
import 'package:flutter_projects/models/article_model.dart';
import 'package:flutter_projects/pages/article_page.dart';
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
          icon: const Icon(Icons.menu, color: Colors.white,),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _NewsOfTheDay(article: article),
          _BreakingNews(
            artciles: Article.articles,
          )
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
      isContainerTitle: true,
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      imageUrl: article.imageUrl,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // News of the day tag
          CustomTag(backgroundColor: Colors.grey.withAlpha(150), children: [
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
              style:
                  TextButton.styleFrom(padding: const EdgeInsets.only(left: 3)),
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

class _BreakingNews extends StatelessWidget {
  const _BreakingNews({
    Key? key,
    required this.artciles,
  }) : super(key: key);

  final List<Article> artciles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Breaking News and More Text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Breaking News',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text('More', style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: artciles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(
                              context, ArticlePage.routeName,
                              arguments: artciles[index]
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImageContainer(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 150,
                                imageUrl: artciles[index].imageUrl,
                                isContainerTitle: false
                            ),
                            const SizedBox(height: 10,),
                            // Breaking News Title
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(artciles[index].title,
                                maxLines: 2,
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold, height: 1.5, fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            // Time posting
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                '${DateTime.now().difference(artciles[index].createdAt).inHours} hours ago',
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13)!,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            // Author
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'By ${artciles[index].author}',
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
