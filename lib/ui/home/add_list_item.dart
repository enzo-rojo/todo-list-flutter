import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_flutter/models/item_list_model.dart';

class AddListItem extends StatefulWidget {
  final String listId;
  final String? userId;
  AddListItem({
    Key? key,
    required this.listId,
    required this.userId,
  }) : super(key: key);

  @override
  State<AddListItem> createState() => _AddListItemState();
}

class _AddListItemState extends State<AddListItem> {
  Future createListItem() async {
    final docUser = FirebaseFirestore.instance
        .collection('users/${widget.userId}/lists')
        .doc(widget.listId);

    final item = ItemListModel(title: "", isChecked: false);

    // Update
    docUser.update({
      'itemList': FieldValue.arrayUnion([item.toJson()]),
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => createListItem(),
      icon: const Icon(
        Icons.add_rounded,
        size: 22,
      ),
      label: Text(
        'Add',
        style: GoogleFonts.varelaRound(
          fontWeight: FontWeight.w700,
        ),
      ),
      style: TextButton.styleFrom(
        primary: const Color(0xFF666666),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
