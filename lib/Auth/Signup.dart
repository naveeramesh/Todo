import 'package:flutter/material.dart';
import 'package:todo_app/constants/text.dart';
import 'package:todo_app/widgets/data.dart';
import 'package:todo_app/widgets/page_view.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int _currentpg = 0;
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (b) => Signup()));
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
                child: Helper.text("Smart Todo Management", 30, 0, Colors.black,
                    FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 20, top: 10),
          child: Row(
            children: [
              Helper.text("This tool is designed to mange your daily task", 18,
                  0, Colors.black, FontWeight.bold),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Helper.text(
                  "Signin with Google", 20, 0, Colors.white, FontWeight.bold),
            ),
          ),
        ),
      ],
    ));
  }
}
