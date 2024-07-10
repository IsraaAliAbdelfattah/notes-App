import 'package:flutter/material.dart';
import 'package:noteapp/constanse.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(kprimarycolor),
          
        ),
        onPressed: (){},
       child: Text('add',style: TextStyle(color: Colors.black),)),
    );
  }
}