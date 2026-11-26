import 'package:flutter/material.dart';

class OutputPage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String gender;
  final String department;

  const OutputPage({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.department,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(title: Text("Output page"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [Text("First Name: $firstName"),
        SizedBox(height: 15),
        Text("Last Name: $lastName"),
        SizedBox(height: 15),
        Text("Gender: $gender"),
        SizedBox(height: 15),
        Text("Department: $department"),
        ]),
      ),
    );
  }
}
