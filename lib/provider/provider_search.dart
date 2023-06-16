import 'package:flutter/cupertino.dart';

class SearchProvider extends ChangeNotifier
{

  String? articleValue;


  void getValue(String newValue) {
     articleValue = newValue;
    notifyListeners();
  }


}