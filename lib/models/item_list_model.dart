class ItemListModel {
  String title;
  bool isChecked;
  ItemListModel({
    required this.title,
    required this.isChecked,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "isChecked": isChecked,
      };

  static ItemListModel fromJson(Map<String, dynamic> json) => ItemListModel(
        title: json['title'],
        isChecked: json['isChecked'],
      );

  static List<ItemListModel> fromJsonList(
          List<Map<String, dynamic>> jsonList) =>
      List<ItemListModel>.generate(
        jsonList.length,
        (int index) => ItemListModel.fromJson(jsonList[index]),
      );
}
