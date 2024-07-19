import 'package:flutter/material.dart';
import 'package:noteapp/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, this.onpressed,  this.isloading=false,
  });
final void Function()? onpressed;
final bool isloading;
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(kprimarycolor),
          
        ),
        onPressed: onpressed,
       child:isloading?const CircularProgressIndicator(
        color: Colors.black,
        
       ): const Text('add',style: TextStyle(color: Colors.black),)),
    );
  }
}