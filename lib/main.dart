import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/Views/edit_note_view.dart';
import 'package:noteapp/Views/notes_view.dart';
import 'package:noteapp/constanse.dart';

void main()async{
  await Hive.initFlutter();
  await Hive.openBox(knotebox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NotesView.id,
      theme: ThemeData(brightness: Brightness.dark,fontFamily: 'Poppins'),
      
      routes: {
      NotesView.id:(context) => NotesView(),
      EditNoteView.id:(context) => EditNoteView(),
      },
    );
  }
}