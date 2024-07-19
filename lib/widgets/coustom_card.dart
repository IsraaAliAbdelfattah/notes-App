import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Views/edit_note_view.dart';
import 'package:noteapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:noteapp/models/note_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.notes});
final NoteModel notes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, EditNoteView.id);
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 200,
              width: double.infinity,
              child:  Card(
                color: Color(notes.color),
              ),
            ),
          ),
          Positioned(
            left: 30,
            top:20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(notes.title,style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black
                    ),),
                    const SizedBox(
                      width: 140,
                    ),
                    IconButton(onPressed: (){
                      notes.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                     icon: const Icon(Icons.delete,color: Colors.black,),),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(notes.subtitle,style: TextStyle(
                  color: Colors.black.withOpacity(.3),
                  fontSize: 18
                ),),
                
                Padding(
                  padding: const EdgeInsets.only(left: 210,top: 20),
                  child: Text(notes.date,style: TextStyle(
                  color: Colors.black.withOpacity(.3),
                    fontSize: 15
                  ),),
                )
              ],
            )),
        ],
      ),
    );
  }
}