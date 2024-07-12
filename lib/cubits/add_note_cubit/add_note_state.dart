//part of'notes_cubit.dart';

abstract class AddNotesState {}
class AddNotesInitial extends AddNotesState{}
class AddNotesLoading extends AddNotesState{}
class AddNotesSucess extends AddNotesState{}
class AddNotesFailure extends AddNotesState{
  final String errormessage;
  AddNotesFailure({required this.errormessage});
}