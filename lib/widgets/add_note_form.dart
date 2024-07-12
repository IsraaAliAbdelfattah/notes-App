import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/widgets/custom_button.dart';
import 'package:noteapp/widgets/custom_text_field.dart';

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
              var notemodel =NoteModel(title: title!, subtitle: subtitle!, date: DateTime.now().toString(), color: Colors.blue.value);
              BlocProvider.of<AddNotesCubit>(context).addnote(notemodel);
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

