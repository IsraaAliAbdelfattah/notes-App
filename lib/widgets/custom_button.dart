import 'package:flutter/material.dart';
import 'package:noteapp/constanse.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, this.onpressed,  this.isloading=false,
  });
final void Function()? onpressed;
final bool isloading;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(kprimarycolor),
          
        ),
        onPressed: onpressed,
       child:isloading?CircularProgressIndicator(
        color: Colors.black,
        
       ): Text('add',style: TextStyle(color: Colors.black),)),
    );
  }
}