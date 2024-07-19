import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:noteapp/widgets/coustom_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List notes = BlocProvider.of<NotesCubit>(context).notes??[];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ListView.builder(
              itemCount:notes.length ,
              itemBuilder: (context, index) {
                return CustomCard(
                  notes: notes[index],
                );
              }),
        );
      },
    );
  }
}
