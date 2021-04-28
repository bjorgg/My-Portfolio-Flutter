import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:myportfolio/views/home/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        // This is the theme of the application.
        textTheme: GoogleFonts.ubuntuMonoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomeView(),
    );
  }
}
