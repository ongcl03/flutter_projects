import 'package:flutter/material.dart';
import 'package:flutter_projects/pages/article_page.dart';
import 'package:flutter_projects/pages/home_page.dart';
import 'package:flutter_projects/widgets/bottom_nav_bar.dart';
import 'package:flutter_projects/widgets/image_container.dart';

import '../models/article_model.dart';

class DiscoverPage extends StatelessWidget {
  DiscoverPage({Key? key}) : super(key: key);

  static const routeName = '/discover';
  final List<String> tabs = ['Health', 'Politics', 'Art', 'Food', 'Science'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ),
        bottomNavigationBar: const BottomNavBar(index: 1),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const _DiscoverNews(),
            _CategoryNews(tabs: tabs)],
        ),
      ),
    );
  }
}

// The tab bar and the list view
class _CategoryNews extends StatelessWidget {
  const _CategoryNews({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    final articles = Article.articles;
    return Column(
      children: [

        // Tab bar for categories
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: Colors.black38,
          tabs: tabs
              .map((tab) => Tab(
                    icon: Text(tab,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                  ))
              .toList(),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
              children: tabs
                  .map((tab) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, ArticlePage.routeName, arguments: articles[index]);
                            },
                            child: Row(
                              children: [
                                // The square image in the list view
                                ImageContainer(
                                    margin: const EdgeInsets.all(10),
                                    borderRadius: 5,
                                    width: 80,
                                    height: 80,
                                    imageUrl: articles[index].imageUrl,
                                    isContainerTitle: false),

                                // The title, time and views text
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      // Title
                                      Text(
                                        articles[index].title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 10,),
                                      // Time and view text
                                      Row(
                                        children: [
                                          // Clock icon
                                          const Icon(Icons.schedule, size: 18, color: Colors.black54,),
                                          const SizedBox(width: 5,),

                                          // Time text
                                          Text(
                                            '${DateTime.now().difference(articles[index].createdAt).inHours} hours ago',
                                            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13),
                                          ),
                                          const SizedBox(width: 20,),

                                          //View icon
                                          const Icon(Icons.visibility, size: 18, color: Colors.black54,),
                                          const SizedBox(width: 3,),

                                          // View text
                                          Text("${articles[index].views} views", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13),)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ))
                  .toList()),
        )
      ],
    );
  }
}

// Upper part of discover page (discover text, news from all... text, search bar)
class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Use sized box to constraint the height
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Discover text
          Text(
            "Discover",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 8,
          ),

          // News from all over the world text
          Text(
            "News from all over the world",
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15),
          ),
          const SizedBox(
            height: 20,
          ),

          // Search bar
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Search',
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const RotatedBox(
                    quarterTurns: 1,
                    child: Icon(
                      Icons.tune,
                      color: Colors.grey,
                    )),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                )),
          )
        ],
      ),
    );
  }
}
