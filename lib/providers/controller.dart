import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/items.dart';

class TodoNotifier extends ChangeNotifier {
  List<Items> itemlist = [];
  UnmodifiableListView<Items> get _itemlist => UnmodifiableListView(itemlist);

  addItem(Items items) async {
    itemlist.add(items);
    notifyListeners();
  }

  deleteUser(index) async {
    itemlist.removeWhere((user) => user.task == _itemlist[index].task);
    notifyListeners();
  }
}
