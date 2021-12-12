import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class CreateStudent extends StatefulWidget {
  const CreateStudent({Key? key}) : super(key: key);

  @override
  _CreateStudentState createState() => _CreateStudentState();
}

class _CreateStudentState extends State<CreateStudent> {

  CollectionReference students = FirebaseFirestore.instance.collection('students');
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  String name = "";
  String email = "";

  @override
  Widget build(BuildContext context) {

    Future<void> addStudent(String name, String email) {

      return students.add({
        'name': name,
        'email': email,
      }).then((value) => print("User Added")).catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Student Entry"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextField(
                keyboardType: TextInputType.text,
                controller: controllerName,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.65,
            ),
            const SizedBox(height: 10),
            Container(
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: controllerEmail,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.65,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => {
                addStudent(controllerName.text, controllerEmail.text),
                controllerName.text = "",
                controllerEmail.text = "",
              },
              child: const Text("Add Student"),
            ),
          ],
        ),
      ),
    );
  }
}

