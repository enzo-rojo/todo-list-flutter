import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_flutter/services/user_service.dart';
import 'package:todo_list_flutter/ui/home/text_input.dart';
import 'package:todo_list_flutter/ui/home/accordion.dart';
import '../../models/list_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Auth

  final UserService _userService = UserService();
  String? _uid;
  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();

    // Set Uid
    _userService.auth().then((value) {
      setState(() {
        _uid = value;
      });
    });
  }

  listBuilder(list) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: list.length,
      separatorBuilder: ((context, index) => const SizedBox(height: 10)),
      itemBuilder: ((context, index) {
        return Accordion(
          listId: list[index].id,
          userId: _uid,
          title: list[index].name,
          content: list[index].itemList,
        );
      }),
    );
  }

  Stream<List<ListModel>> readLists() => FirebaseFirestore.instance
      .collection('users/$_uid/lists')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => ListModel.fromJson(doc.data(), doc.id))
          .toList());

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
                  TextInput(
                    userId: _uid,
                  ),
                  const SizedBox(height: 10),
                  StreamBuilder<List<ListModel>>(
                    stream: readLists(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong! ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final lists = snapshot.data!;
                        return listBuilder(lists);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
