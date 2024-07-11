import 'package:flutter/material.dart';
import 'package:noteapp/constanse.dart';
import 'package:noteapp/widgets/custom_button.dart';
import 'package:noteapp/widgets/custom_text_field.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 20),
      child: SingleChildScrollView(
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey <FormState> formkey =GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  String? title,subtitle;
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child:  Column(children: [
        CustomTextField(
          text: 'Title',
          onsaved: (value){
             title=value;
          },
        ),
        SizedBox(
          height: 16,
        ),
           CustomTextField(
            text: 'Content',
            maxlines: 5,
            onsaved: (value){
              subtitle=value;
            },
           ),
           SizedBox(height: 30,),
        CustomButton(
          onpressed: (){
            if(formkey.currentState!.validate()){
              formkey.currentState!.save();
            }
            else{
              autovalidateMode = AutovalidateMode.always;
            }
          },
        ),
      ],),
    );
  }
}

