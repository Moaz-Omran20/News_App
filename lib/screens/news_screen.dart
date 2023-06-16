import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/tabs_screen.dart';

import '../models/SourcesResponse.dart';
import '../network/remote/api_manager.dart';

class NewsScreen extends StatelessWidget {
  CategoryModel categoryModel;


  NewsScreen(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getSources(categoryModel.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Column(
            children: const [Center(child: Text("Something went wrong..try again"))],
          );
        } else if (snapshot.data!.status != "ok") {
          return Column(
            children: const [Center(child: Text("error 404"))],
          );
        }
        var sources = snapshot.data?.sources ?? [];
        return TabsScreen(sources);
      },
    );
  }
}
