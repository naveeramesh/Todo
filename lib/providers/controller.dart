import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/items.dart';

class TodoNotifier extends ChangeNotifier {
  List<String> itemlist = [];

  addItem(String task, String desc) async {
    Items items = Items(task, desc);
    itemlist.add(items.toString());
    notifyListeners();
  }
}
