import 'package:classwork_1/pages/student_details_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentDetailsPage()
    );
  }
}
