import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:noteapp/constanse.dart';
import 'package:noteapp/cubits/notes_cubits/notes_state.dart';
import 'package:noteapp/models/note_model.dart';

class NotesCubit extends Cubit<NotesState>{
NotesCubit():super(NotesInitial());
List<NoteModel>?notes;
fetchAllNotes(){
  var notesBox = Hive.box<NoteModel>(knotebox);
    notes=notesBox.values.toList();


}
}