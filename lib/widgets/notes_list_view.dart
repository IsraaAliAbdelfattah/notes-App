import 'package:flutter/material.dart';
import 'package:noteapp/widgets/coustom_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context,index){
        return CustomCard();
      }),
    );
  }
}