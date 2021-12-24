import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextField_Custom extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const TextField_Custom({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: text,
              hintStyle: GoogleFonts.ubuntu(
                  color: Colors.grey, fontWeight: FontWeight.normal),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
            ),
          ),
        ),
      ),
    );
  }
}
