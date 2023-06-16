import 'package:flutter/material.dart';
import 'package:news_app/network/remote/api_manager.dart';
import 'package:news_app/provider/provider_search.dart';
import 'package:news_app/screens/widgets/news_item.dart';
import 'package:news_app/screens/widgets/tab_item.dart';
import 'package:provider/provider.dart';

import '../models/SourcesResponse.dart';

class TabsScreen extends StatefulWidget {
  List<Sources> sources;

  TabsScreen(this.sources);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<SearchProvider>(context);
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
                onTap: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.sources.map((source) {
                  return Tab(
                    child: TabItem(source,
                        widget.sources.indexOf(source) == selectedIndex),
                  );
                }).toList())),
        FutureBuilder(
          future:
              ApiManager.getNewsData(widget.sources[selectedIndex].id ?? "",pro.articleValue??""),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Column(
                children: const [Center(child: Text("Something went wrong..try again"))],
              );
            } else if (snapshot.data!.status != "ok") {
              return Column(
                children: const [Center(child: Text("status api error"))],
              );
            }
            var newsData = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.builder(
                itemCount: newsData.length,
                itemBuilder: (context, index) {
                  return NewsItem(newsData[index]);
                },

              ),
            );
          },
        )
      ],
    );
  }
}
