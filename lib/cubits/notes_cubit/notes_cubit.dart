import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteapp/constanse.dart';
import 'package:noteapp/models/note_model.dart';




part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

   List<NoteModel>? notes;

  fetchAllNotes()  {
    var notesBox = Hive.box<NoteModel>(
      knotebox,
    );
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}