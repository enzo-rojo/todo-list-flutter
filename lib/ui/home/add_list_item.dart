import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddListItem extends StatefulWidget {
  AddListItem({Key? key}) : super(key: key);

  @override
  State<AddListItem> createState() => _AddListItemState();
}

class _AddListItemState extends State<AddListItem> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => print('pressed'),
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
