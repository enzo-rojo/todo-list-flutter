import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_flutter/models/list_model.dart';

class TextInput extends StatelessWidget {
  final String? userId;
  TextInput({
    Key? key,
    required this.userId,
  }) : super(key: key);
  final controller = TextEditingController();

  Future createList({required String name}) async {
    // Reference to document
    final docUser = FirebaseFirestore.instance
        .collection('users/$userId/lists')
        .doc('test-id');

    final list = ListModel(
      name: name,
      itemList: [],
    );

    await docUser.set(list.toJson());

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: 'New list',
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: TextButton.icon(
            onPressed: () {
              final name = controller.text;
              createList(name: name);
            },
            icon: const Icon(
              Icons.add,
              size: 20,
            ),
            label: Text(
              'Add',
              style: GoogleFonts.varelaRound(
                fontWeight: FontWeight.w600,
              ),
            ),
            style: TextButton.styleFrom(
              primary: const Color(0xFF666666),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
