
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteapp/constants.dart';

import '../../models/note_model.dart';



part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color= const Color(0xffF1E9DB);

  addNote(NoteModel note) async {
    note.color=color.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(knotebox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
