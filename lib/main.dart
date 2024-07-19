import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/Views/edit_note_view.dart';
import 'package:noteapp/Views/notes_view.dart';
import 'package:noteapp/constants.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/simple_bloc_observer.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer=SimpleBlocObserver();
  Hive.registerAdapter(NoteModlAdapter());
  await Hive.openBox<NoteModel>(knotebox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: NotesView.id,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      routes: {
        NotesView.id: (context) => const NotesView(),
        EditNoteView.id: (context) => const EditNoteView(),
      },
    );
  }
}
