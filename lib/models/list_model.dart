import 'package:todo_list_flutter/models/item_list_model.dart';

class ListModel {
  String id;
  String name;
  List<dynamic> itemList; // TODO : change type to ItemListModel

  ListModel({
    required this.id,
    required this.name,
    required this.itemList,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "itemList": itemList,
      };

  static ListModel fromJson(Map<String, dynamic> json, String id) => ListModel(
        id: id,
        name: json['name'],
        itemList: json['itemList'],
      );
}
