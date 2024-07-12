import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/constanse.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_state.dart';
import 'package:noteapp/models/note_model.dart';
class AddNotesCubit extends Cubit<AddNotesState>{
AddNotesCubit():super (AddNotesInitial());
addnote(NoteModel note)async{
  emit(AddNotesLoading());
try {
  var notesBox = Hive.box(knotebox);
   await notesBox.add(note);
   emit(AddNotesSucess());
} catch (e) {
  // TODO
  emit(AddNotesFailure(errormessage: e.toString()));
}
}
}