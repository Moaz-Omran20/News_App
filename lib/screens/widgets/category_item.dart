import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;

  CategoryItem(this.categoryModel, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomRight:
                index.isEven ? Radius.circular(0) : Radius.circular(30),
            bottomLeft: index.isEven ? Radius.circular(30) : Radius.circular(0),
          ),
          color: categoryModel.color,
          border: Border.all(color: Colors.transparent)),
      child: Column(
        children: [
          Expanded(child: Image.asset(categoryModel.image)),
          Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * .04),
            child: Text(
              categoryModel.name,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
