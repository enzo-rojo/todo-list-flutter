import 'package:flutter/material.dart';
import 'package:todo_list_flutter/ui/home/text_input.dart';
import 'package:todo_list_flutter/ui/home/accordion.dart';

import '../../models/item_list_model.dart';
import '../../models/list_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _keyboardVisible = false;

  List<ListModel> lists = <ListModel>[
    ListModel(
      name: 'FirstList',
      itemList: <ItemListModel>[
        ItemListModel(title: 'First item 1', isChecked: false),
        ItemListModel(title: 'Second item 1', isChecked: true),
        ItemListModel(title: 'Third item 1', isChecked: false),
      ],
    ),
    ListModel(
      name: 'SecondList',
      itemList: <ItemListModel>[
        ItemListModel(title: 'First item 2', isChecked: true),
        ItemListModel(title: 'Second item 2', isChecked: true),
        ItemListModel(title: 'Third item 2', isChecked: false),
      ],
    ),
    ListModel(
      name: 'ThirdList',
      itemList: <ItemListModel>[
        ItemListModel(title: 'First item 3', isChecked: false),
        ItemListModel(title: 'Second item 3', isChecked: false),
        ItemListModel(title: 'Third item 3', isChecked: false),
      ],
    ),
  ];

  buildList() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: lists.length,
      separatorBuilder: ((context, index) => const SizedBox(height: 10)),
      itemBuilder: ((context, index) {
        return Accordion(
          title: lists[index].name,
          content: lists[index].itemList,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFFFEFF6),
          appBar: AppBar(
            title: const Text(
              'Lists',
              style: TextStyle(fontSize: 25),
            ),
            elevation: 0,
            actions: [
              _keyboardVisible
                  ? TextButton(
                      onPressed: () {
                        print("pressed");
                      },
                      child: const Text('OK'),
                    )
                  : const Text(''),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const TextInput(),
                  const SizedBox(height: 10),
                  buildList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
