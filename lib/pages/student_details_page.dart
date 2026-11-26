import 'package:classwork_1/pages/output_page.dart';
import 'package:flutter/material.dart';

class StudentDetailsPage extends StatefulWidget {
  const new({super.key});

  @override
  State<StudentDetailsPage> createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage> {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  String gender = "";
  String department = "";

  final _formKey = GlobalKey<FormState>();
  final _gap = SizedBox(height: 8);

  String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return "Fields cannot be empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(title: Text("Student Detail Page"), centerTitle: true),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: firstnameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Enter your first name",
                    border: OutlineInputBorder(),
                  ),
                  validator: validateText,
                ),
                _gap,
                TextFormField(
                  controller: lastnameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Enter your last name",
                    border: OutlineInputBorder(),
                  ),
                  validator: validateText,
                ),
                _gap,
                Text(
                  "Gender",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                FormField<String>(
                  validator: validateText,
                  builder: (state) {
                    return Column(
                      children: [
                        RadioGroup<String>(
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                            });
                            state.didChange(value);
                          },
                          child: Column(
                            children: [
                              RadioListTile<String>(
                                title: Text("Male"),
                                value: "Male",
                              ),
                              RadioListTile<String>(
                                title: Text("Female"),
                                value: "Female",
                              ),
                              RadioListTile<String>(
                                title: Text("Others"),
                                value: "Others",
                              ),
                            ],
                          ),
                        ),
                        if (state.hasError)
                          Text(
                            state.errorText!,
                            style: TextStyle(color: Colors.red),
                          ),
                      ],
                    );
                  },
                ),
                _gap,

                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Department",
                    border: OutlineInputBorder(),
                  ),

                  items: ["IT", "Sales", "Finance"].map((dept) {
                    return DropdownMenuItem(value: dept, child: Text(dept));
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return "Please select a department";
                    }
                    return null;
                  },

                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        department = value;
                      });
                    }
                  },
                ),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OutputPage(
                            firstName: firstnameController.text,
                            lastName: lastnameController.text,
                            gender: gender,
                            department: department,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text("Display Details"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    super.dispose();
  }
}
