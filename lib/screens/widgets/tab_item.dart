import 'package:flutter/material.dart';
import 'package:news_app/models/SourcesResponse.dart';

class TabItem extends StatelessWidget {
  Sources source;
  bool selected;

  TabItem(this.source, this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
          color: selected ? Color(0xFF39A552) : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Color(0xFF39A552), width: 2)),
      child: Text(
        source.name ?? "",
        style: TextStyle(
            color: selected ? Colors.white : Color(0xFF39A552),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
