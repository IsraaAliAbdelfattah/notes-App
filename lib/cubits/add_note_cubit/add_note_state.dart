//part of'notes_cubit.dart';

abstract class NotesState {
  
}
class AddNotesInitial extends NotesState{}
class AddNotesLoading extends NotesState{}
class AddNotesSucess extends NotesState{}
class AddNotesFailure extends NotesState{
  final String errormessage;

  AddNotesFailure({required this.errormessage});
}