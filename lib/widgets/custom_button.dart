import 'package:flutter/material.dart';
import 'package:noteapp/constanse.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, this.onpressed,
  });
final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(kprimarycolor),
          
        ),
        onPressed: onpressed,
       child: Text('add',style: TextStyle(color: Colors.black),)),
    );
  }
}