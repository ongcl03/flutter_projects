import 'package:flutter/material.dart';
import 'package:flutter_projects/models/article_model.dart';
import 'package:flutter_projects/widgets/custom_tag.dart';
import 'package:flutter_projects/widgets/image_container.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key}) : super(key: key);

  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    // To get the Article Object (one article) which been passed from the home page and discover page
    final article = ModalRoute.of(context)!.settings.arguments as Article;

    // Instead of Scaffold, return this will cover the whole page with the image
    return ImageContainer(
      width: double.infinity,
      imageUrl: article.imageUrl,
      isContainerTitle: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            _NewsHeadLine(article: article,),
            _NewsBody(article: article)
          ],
        ),
      ),
    );
  }
}

class _NewsBody extends StatelessWidget {
  const _NewsBody({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: Column(
        children: [
          // Tags row
          Row(
            children: [
              // Author tag
              CustomTag(backgroundColor: Colors.black, children: [
                CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(article.authorImageUrl),
                ),
                const SizedBox(width: 10,),
                Text(
                  article.author,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              ]),
              const SizedBox(width: 10,),

              // Time tag
              CustomTag(backgroundColor: Colors.grey.shade200, children: [
                const Icon(Icons.timer, color: Colors.grey,),
                const SizedBox(width: 10,),
                Text(
                  "${DateTime.now().difference(article.createdAt).inHours}h",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                ),
              ]),
              const SizedBox(width: 10,),

              // Views tag
              CustomTag(backgroundColor: Colors.grey.shade200, children: [
                const Icon(Icons.remove_red_eye, color: Colors.grey,),
                const SizedBox(width: 10,),
                Text(
                    "${article.views}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                ),
              ]),
            ],
          ),
          const SizedBox(height: 20,),

          // Title text
          Text(
            article.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold
            )
          ),
          const SizedBox(height: 20,),

          // Body text
          Text(
              article.body,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  height: 1.5
              )
          ),
          const SizedBox(height: 20,),

          // GridView of the images
          GridView.builder(
              shrinkWrap: true,
              itemCount: 2,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.25),
              itemBuilder: (context, index){
                return ImageContainer(
                    width: MediaQuery.of(context).size.width * 0.42,
                    imageUrl: article.imageUrl,
                    isContainerTitle: false,
                    margin: const EdgeInsets.only(right: 5.0, left: 5.0),
                );
              }
          )
        ],
      ),
    );
  }
}

// The upper part of the article page (tag, title, subtitle)
class _NewsHeadLine extends StatelessWidget {
  const _NewsHeadLine({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
          // Category tag
          CustomTag(backgroundColor: Colors.grey.withAlpha(150), children: [
            Text(
              article.category,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
          ]),
          const SizedBox(
            height: 10,
          ),

          // Title text
          Text(article.title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1.25)),
          const SizedBox(
            height: 10,
          ),

          // Subtitle text
          Text(article.subtitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
