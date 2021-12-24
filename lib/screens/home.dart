import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/text.dart';
import 'package:todo_app/model/items.dart';
import 'package:todo_app/providers/controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoNotifier todoNotifier = Provider.of<TodoNotifier>(context);
    TextEditingController taskcontroller = new TextEditingController();
    TextEditingController desccontroller = new TextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            builder: (context) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: taskcontroller,
                        decoration: InputDecoration(
                          hintText: "Task",
                          hintStyle: GoogleFonts.ubuntu(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: desccontroller,
                        decoration: InputDecoration(
                          hintText: "Description",
                          hintStyle: GoogleFonts.ubuntu(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      todoNotifier.addItem(
                          Items(taskcontroller.text, desccontroller.text));
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Helper.text(
                            "Add task", 20, 0, Colors.white, FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Helper.text("Todo", 30, 0, Colors.white, FontWeight.bold),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: todoNotifier.itemlist.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                        child: Consumer<TodoNotifier>(
                          builder: (context, value, child) => Helper.text(
                              "Task : ${value.itemlist[index].task}",
                              18,
                              0,
                              Colors.black,
                              FontWeight.normal),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Consumer<TodoNotifier>(
                          builder: (context, value, child) => Helper.text(
                              "Description : ${value.itemlist[index].description}",
                              18,
                              0,
                              Colors.black,
                              FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
