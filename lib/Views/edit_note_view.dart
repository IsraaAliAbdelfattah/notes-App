import 'package:flutter/material.dart';
import 'package:noteapp/widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});
static String id='Edit Note View';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          decoration: BoxDecoration(
             color:Colors.white.withOpacity(.05) ,
            borderRadius: BorderRadius.circular(16)),
          child: IconButton(onPressed: (){},
           icon: const Icon(Icons.check)),
        ),
      )
    ],
    title: const Text('Edit Note'),
    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:  ListView(
        children:const [
           CustomTextField(text: 'Title'),
           SizedBox(height: 16,),
           CustomTextField(text: 'Content',maxlines: 7,),
        ],
      ),
    ),
    );
  }
}