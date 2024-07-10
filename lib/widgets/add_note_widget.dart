import 'package:flutter/material.dart';
import 'package:noteapp/constanse.dart';
import 'package:noteapp/widgets/custom_button.dart';
import 'package:noteapp/widgets/custom_text_field.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
      child: SingleChildScrollView(
        child: Column(children: [
          CustomTextField(
            text: 'Title',
            
          ),
          SizedBox(
            height: 16,
          ),
             CustomTextField(
              text: 'Content',
              maxlines: 5,
             ),
             SizedBox(height: 30,),
          CustomButton(),
        ],),
      ),
    );
  }
}

