import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/Auth/Signup.dart';
import 'package:todo_app/Auth/google_signin.dart';
import 'package:todo_app/Main/taskview.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/text.dart';
import 'package:todo_app/widgets/modelbottomsheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              builder: (context) => modelsheet());
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Helper.text("Hello ${_auth.currentUser!.displayName}", 20, 0,
                Colors.black, FontWeight.bold),
            _auth.currentUser?.photoURL != null
                ? GestureDetector(
                    onTap: () {
                      signout().whenComplete(() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (b) => Signup()));
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${_auth.currentUser!.photoURL}"))),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
      body: TaskView(),
    );
  }
}
