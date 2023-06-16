import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  var categories = CategoryModel.getCategories();
  Function onCategorySelect;

  CategoriesScreen(this.onCategorySelect);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: const Text(
              "Pick your category of interest:",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategorySelect(categories[index]);
                    },
                    child: CategoryItem(categories[index], index));
              },
            ),
          ),
        ],
      ),
    );
  }
}
