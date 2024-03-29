import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Auth/google_signin.dart';
import 'package:todo_app/Main/homescreen.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/text.dart';
import 'package:todo_app/widgets/data.dart';
import 'package:todo_app/widgets/page_view.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  int _currentpg = 0;
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (b) => HomeScreen()));
                      },
                      child: Helper.text(
                          "Skip", 15, 0, Colors.black, FontWeight.normal))
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: data_list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Page_View(
                    items: data_list[index],
                  );
                },
                onPageChanged: (value) => setState(() {
                  _currentpg = value;
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 200, maxHeight: 100),
                    child: Helper.text("Smart Todo Management", 30, 0,
                        Colors.black, FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 20, top: 20),
              child: Row(
                children: [
                  Helper.text("This tool is designed to mange your daily task",
                      18, 0, Colors.black, FontWeight.bold),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  signin().whenComplete(() {
                    if (_auth.currentUser?.email != null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (b) => HomeScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.grey,
                          content: Helper.text("Signin to use application", 15,
                              0, Colors.black, FontWeight.normal)));
                    }
                  });
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: appcolor, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Helper.text("Signin with Google", 20, 0,
                        Colors.white, FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
