import 'package:flutter/material.dart';
import 'package:noteapp/constanse.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,required this.text,  this.maxlines=1});
final String text;
final int maxlines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kprimarycolor,
      maxLines: maxlines,
          decoration: InputDecoration(
            border: BuildBorder(),
            enabledBorder: BuildBorder(),
            focusedBorder: BuildBorder(kprimarycolor),
            hintText: text,
             hintStyle: TextStyle(
              color: kprimarycolor,
            ),
          ),
        );
  }

  OutlineInputBorder BuildBorder([color]) {
    return OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color:color?? Colors.white),
          );
  }
}