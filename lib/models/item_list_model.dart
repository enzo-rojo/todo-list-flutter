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
}
