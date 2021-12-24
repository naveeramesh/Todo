import 'package:flutter/material.dart';
import 'package:todo_app/constants/text.dart';
import 'package:todo_app/widgets/modelsheet.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Helper.text("Todo", 30, 0, Colors.blue, FontWeight.bold),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
    );
  }
}
