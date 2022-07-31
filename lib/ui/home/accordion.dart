import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Accordion extends StatefulWidget {
  final String title;
  final String content;

  const Accordion({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              elevation: 0,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              setState(() {
                _showContent = !_showContent;
              });
            },
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.varelaRound(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            )),
        FractionallySizedBox(
          widthFactor: 1,
          child: AnimatedContainer(
            constraints: BoxConstraints(
              maxHeight: _showContent ? 100 : 0,
            ),
            duration: const Duration(milliseconds: 300),
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Text(widget.content),
          ),
        ),
      ],
    );
  }
}
