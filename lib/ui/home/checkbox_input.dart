import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckBoxInput extends StatefulWidget {
  String title;
  bool isChecked;

  CheckBoxInput({
    Key? key,
    required this.title,
    required this.isChecked,
  }) : super(key: key);

  @override
  State<CheckBoxInput> createState() => _CheckBoxInputState();
}

class _CheckBoxInputState extends State<CheckBoxInput> {
  String _title = 'New Item';
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _isChecked = widget.isChecked;
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
