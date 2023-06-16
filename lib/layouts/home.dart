import 'package:flutter/material.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/network/remote/api_manager.dart';
import 'package:news_app/provider/provider_search.dart';
import 'package:news_app/screens/categories_screens.dart';
import 'package:news_app/screens/news_screen.dart';
import 'package:news_app/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

import '../screens/widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool searchIcon = false;
  bool searchBar = false;
  var atricleSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchProvider>(context);
    return Scaffold(
      drawer: DrawerWidget(onDrawerClick),
      appBar: AppBar(
        actions: [
          if (searchIcon)
            IconButton(
              onPressed: () {
                searchBar = true;
                searchIcon = false;
                setState(() {});
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            )
        ],
        title: searchBar
            ? Container(
                height: 46,
                child: TextField(
                  onChanged: (value) {
                    provider.articleValue = value;
                  },
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                      prefixIcon: InkWell(
                          onTap: () {
                            searchIcon = true;
                            searchBar = false;
                            provider.articleValue="";
                            setState(() {});
                          },
                          child: const Icon(
                            Icons.close,
                            size: 28,
                          )),
                      prefixIconColor: const Color(0xFF39A552),
                      suffixIconColor: const Color(0xFF39A552),
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      contentPadding: const EdgeInsets.only(top: 8),
                      hintText: 'Enter a search term',
                      hintStyle: const TextStyle(color: Colors.grey)),
                ),
              )
            : Text(
                categorySelected == null ? "News App" : categorySelected!.name,
              ),
        centerTitle: true,
        backgroundColor: const Color(0xFF39A552),
        shape: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        elevation: 0,
      ),
      body: Stack(children: [
        Image.asset(
          "assets/images/pattern.png",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        categorySelected == null
            ? CategoriesScreen(onCategorySelected)
            : NewsScreen(categorySelected!)
      ]),
    );
  }

  CategoryModel? categorySelected = null;

  void onDrawerClick(int num) {
    if (num == DrawerWidget.CATEGORY) {
      categorySelected = null;
      searchIcon = false;
      searchBar = false;
    } else if (num == DrawerWidget.Settings) {}
    Navigator.pop(context);
    setState(() {});
  }

  void onCategorySelected(category) {
    categorySelected = category;
    searchIcon = true;
    setState(() {});
  }

  showSearchField() {}
}
