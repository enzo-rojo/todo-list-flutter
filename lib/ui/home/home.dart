import 'package:flutter/material.dart';
import 'package:todo_list_flutter/ui/home/text_input.dart';
import 'package:todo_list_flutter/ui/home/accordion.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFEFF6),
        appBar: AppBar(
          title: const Text(
            'Lists',
            style: TextStyle(fontSize: 25),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              TextInput(),
              SizedBox(
                height: 10,
              ),
              Accordion(title: 'Test', content: 'Test content'),
              SizedBox(
                height: 10,
              ),
              Accordion(title: 'Test', content: 'Test content')
            ],
          ),
        ),
      ),
    );
  }
}
