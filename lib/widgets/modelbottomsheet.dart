import 'package:flutter/material.dart';

class modelsheet extends StatelessWidget {
  const modelsheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: new Container(
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0))),
          child: new Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
    );
  }
}
