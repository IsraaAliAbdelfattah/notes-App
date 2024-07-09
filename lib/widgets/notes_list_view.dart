import 'package:flutter/material.dart';
import 'package:noteapp/widgets/coustom_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context,index){
      return CustomCard();
    });
  }
}