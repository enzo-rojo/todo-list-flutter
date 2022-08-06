import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_flutter/models/item_list_model.dart';
import 'package:todo_list_flutter/models/list_model.dart';
import 'package:todo_list_flutter/ui/home/add_list_item.dart';
import 'package:todo_list_flutter/ui/home/checkbox_input.dart';

class Accordion extends StatefulWidget {
  final String title;
  final List<dynamic> content; // TODO : change type to ItemListModel

  const Accordion({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool _showContent = false;

  @override
  void initState() {
    super.initState();
  }

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
              maxHeight: _showContent ? 2000 : 0,
            ),
            duration: Duration(milliseconds: _showContent ? 700 : 200),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return CheckBoxInput(
                        title: widget.content[index].title,
                        isChecked: widget.content[index].isChecked,
                      );
                    }),
                    itemCount: widget.content.length,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AddListItem(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
