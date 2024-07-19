import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/widgets/custom_button.dart';
import 'package:noteapp/widgets/custom_text_field.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_state.dart';
class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  int? color;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            text: 'Title',
            onsaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            text: 'Content',
            maxlines: 5,
            onsaved: (value) {
              subtitle = value;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isloading: state is AddNoteLoading?true:false,
                onpressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    DateTime current =DateTime.now();
                    var formatedDate = DateFormat('dd-mm-yyyy').format(current);
                    var notemodel = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date:formatedDate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(notemodel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {
                      
                    });
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
