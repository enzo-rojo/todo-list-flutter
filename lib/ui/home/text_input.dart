import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInput extends StatelessWidget {
  const TextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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
            onPressed: () => print('pressed'),
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
