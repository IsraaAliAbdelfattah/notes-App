import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/notes_cubits/notes_cubit.dart';
import 'package:noteapp/widgets/add_note_widget.dart';
import 'package:noteapp/widgets/coustom_card.dart';
import 'package:noteapp/widgets/notes_list_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
static String id='Notes View';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Notes',style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color:Colors.white.withOpacity(.05) ,
                  shape: BoxShape.circle
                  ),
                child: Center(
                  child: IconButton(onPressed: (){}, 
                  icon: Icon(Icons.search,)),
                ),
              ),
            ),
          ],
        ),
        body: NotesListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
           showModalBottomSheet(
            isScrollControlled: true,
            context: context, builder: (context){
            return AddNoteButtomSheet();
           });
        },
        child: Icon(Icons.add,color: Colors.black,),
        backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}