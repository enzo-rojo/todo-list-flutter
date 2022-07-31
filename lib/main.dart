import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_flutter/ui/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final InputDecorationTheme textInputTheme = InputDecorationTheme(
    hintStyle: GoogleFonts.varelaRound(
      fontWeight: FontWeight.w700,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color(0xFFFF81B8),
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    border: const OutlineInputBorder(),
    disabledBorder: InputBorder.none,
    filled: true,
    fillColor: Colors.white,
  );

  final AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: const Color(0xFFFFEFF6),
    titleTextStyle: GoogleFonts.varelaRound(
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: textInputTheme,
        appBarTheme: appBarTheme,
      ),
      home: const HomeScreen(),
    );
  }
}
