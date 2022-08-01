import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckBoxInput extends StatefulWidget {
  CheckBoxInput({Key? key}) : super(key: key);

  @override
  State<CheckBoxInput> createState() => _CheckBoxInputState();
}

class _CheckBoxInputState extends State<CheckBoxInput> {
  bool _checked = false;
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
            value: _checked,
            activeColor: const Color.fromARGB(255, 0, 0, 0),
            onChanged: (bool? value) {
              setState(() {
                _checked = !_checked;
              });
            },
          ),
        ),
        Expanded(
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            style: _checked ? isCheckedTextStyle : isNotCheckedTextStyle,
            decoration: const InputDecoration(
              filled: false,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: 'New list',
            ),
          ),
        ),
      ],
    );
  }
}
