import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/text.dart';
import 'package:todo_app/widgets/text_field.dart';

class modelsheet extends StatefulWidget {
  const modelsheet({
    Key? key,
  }) : super(key: key);

  @override
  State<modelsheet> createState() => _modelsheetState();
}

class _modelsheetState extends State<modelsheet> {
  DateTime? currenttime = DateTime.now();
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController workcontroller = TextEditingController();
  TextEditingController schedulecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: new Container(
          child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          TextField_Custom(
              text: "Enter your work for today",
              controller: workcontroller,
              width: MediaQuery.of(context).size.width),
          TextField_Custom(
              text: "Schedule to complete",
              controller: schedulecontroller,
              width: MediaQuery.of(context).size.width),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                addWork().whenComplete(() {
                  Navigator.pop(context);
                });
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: appcolor, borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Helper.text(
                      "Add your work", 20, 0, Colors.white, FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  Future<void> addWork() async {
    FirebaseFirestore.instance
        .collection("Task")
        .doc(currenttime.toString())
        .set({
      "taskname": workcontroller.text.trim(),
      "schedule": schedulecontroller.text.trim(),
      "time": currenttime.toString()
    });
  }
}
