import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/constants.dart';
import 'package:noteapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/widgets/colors_listview.dart';
import 'package:noteapp/widgets/custom_text_field.dart';
import 'package:noteapp/widgets/edit_note_color_list.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
static String id='Edit Note View';
final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? titel,content;
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
          child: IconButton(onPressed: (){
            widget.note.title=titel??widget.note.title;
            widget.note.subtitle=content??widget.note.subtitle;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          },
           icon: const Icon(Icons.check)),
        ),
      )
    ],
    title: const Text('Edit Note'),
    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:  ListView(
        children: [
           CustomTextField(text: widget.note.title,
           onChanged: (value){
               titel=value; 
           },
           ),
           SizedBox(height: 16,),
           CustomTextField(text: widget.note.subtitle,
           onChanged: (Value){
            content=Value;
           },
           maxlines: 7,),
           SizedBox(
            height: 10,
           ),
           EditNoteColorsList(note: widget.note),
        ],
      ),
    ),
    );
  }
}