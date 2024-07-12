import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:noteapp/constanse.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_state.dart';
import 'package:noteapp/widgets/add_note_form.dart';
import 'package:noteapp/widgets/custom_button.dart';
import 'package:noteapp/widgets/custom_text_field.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => AddNotesCubit(),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: BlocConsumer<AddNotesCubit, AddNotesState>(
            listener: (context, state) {
              if(state is AddNotesFailure){
               print('Failed ${state.errormessage}');
              }
              if(state is AddNotesSucess){
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is AddNotesLoading? true :false,
                child: SingleChildScrollView(child: AddNoteForm()));
            },
          ),
        ),
    );
  }
}
