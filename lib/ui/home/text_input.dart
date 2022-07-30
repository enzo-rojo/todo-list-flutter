import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: 'New list',
        // suffixIcon: IconButton(
        //   onPressed: () => print('pressed'),
        //   icon: const Icon(Icons.add),
        //   splashRadius: 25,
        // ),
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
            label: const Text(
              'Add',
              style: TextStyle(fontWeight: FontWeight.w500),
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
      style: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
