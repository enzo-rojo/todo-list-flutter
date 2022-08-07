import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/item_list_model.dart';

class CheckBoxInput extends StatefulWidget {
  String? userId;
  String listId;
  String title;
  bool isChecked;

  CheckBoxInput({
    Key? key,
    required this.userId,
    required this.listId,
    required this.title,
    required this.isChecked,
  }) : super(key: key);

  @override
  State<CheckBoxInput> createState() => _CheckBoxInputState();
}

class _CheckBoxInputState extends State<CheckBoxInput> {
  String _title = 'New Item';
  String _oldTitle = '';
  bool _isChecked = false;
  final TextEditingController textController = TextEditingController();

  Future updateItemTitle(String title) async {
    final docUser = FirebaseFirestore.instance
        .collection('users/${widget.userId}/lists')
        .doc(widget.listId);

    // Retrieve data
    final snapshot = await docUser.get();

    List<dynamic> list = snapshot.data()?['itemList'];

    // Build new ItemListModel
    final item = ItemListModel(title: _title, isChecked: false);

    // Retrieve item where title === _oldTitle
    int index = list.indexWhere((e) => e['title'] == _oldTitle);

    // Update list
    list[index] = item.toJson();

    // Update
    docUser.update({
      'itemList': list,
    });

    // Remove focus
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void initState() {
    super.initState();
    _oldTitle = widget.title;
    _title = widget.title;
    _isChecked = widget.isChecked;
    textController.text = _title;
  }

  TextStyle isCheckedTextStyle = const TextStyle(
      fontSize: 16,
      decoration: TextDecoration.lineThrough,
      color: Color.fromARGB(255, 140, 140, 140));
  TextStyle isNotCheckedTextStyle = const TextStyle(
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            splashRadius: 13,
            shape: const CircleBorder(),
            tristate: true,
            value: _isChecked,
            activeColor: const Color.fromARGB(255, 0, 0, 0),
            onChanged: (bool? value) {
              setState(() {
                _isChecked = !_isChecked;
              });
            },
          ),
        ),
        Expanded(
          child: TextField(
            controller: textController,
            onChanged: (value) => _title = textController.text,
            onEditingComplete: () => updateItemTitle(_title),
            textAlignVertical: TextAlignVertical.center,
            style: _isChecked ? isCheckedTextStyle : isNotCheckedTextStyle,
            decoration: InputDecoration(
              filled: false,
              enabledBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: _title,
            ),
          ),
        ),
      ],
    );
  }
}
