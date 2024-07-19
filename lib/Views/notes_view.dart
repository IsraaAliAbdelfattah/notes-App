import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:noteapp/widgets/add_note_widget.dart';
import 'package:noteapp/widgets/notes_list_view.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});
static String id='Notes View';

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Notes',style: TextStyle(
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
                icon: const Icon(Icons.search,)),
              ),
            ),
          ),
        ],
      ),
      body: const NotesListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         showModalBottomSheet(
          isScrollControlled: true,
          context: context, builder: (context){
          return const AddNoteButtomSheet();
         });
      },
      backgroundColor: Colors.blue,
      child:  const Icon(Icons.add,color: Colors.black,),
      ),
    );
  }
}