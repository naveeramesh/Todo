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
  TextEditingController workcontroller = TextEditingController();
  TextEditingController schedulecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: new Container(
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0))),
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
                  onTap: () {},
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: appcolor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Helper.text("Add your work", 20, 0, Colors.white,
                          FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
