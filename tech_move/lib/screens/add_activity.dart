
import 'package:flutter/material.dart';
import 'package:tech_move/components/activity_form.dart';

class AddActivityScreen extends StatelessWidget {
  const AddActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Atividade"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: ActivityForm(),
      ),
    );
  }

}