import 'package:todo_list_flutter/models/item_list_model.dart';

class ListModel {
  String name;
  List<ItemListModel> itemList;

  ListModel({
    required this.name,
    required this.itemList,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "itemList": itemList,
      };
}
