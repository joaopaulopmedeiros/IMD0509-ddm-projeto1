
import 'package:flutter/material.dart';
import 'package:tech_move/components/activity_form.dart';
import 'package:tech_move/models/User.dart';
import 'package:tech_move/models/activity.dart';

class AddActivityScreen extends StatelessWidget {
  const AddActivityScreen({super.key, required User user, required Null Function(Activity activity) onActivityAdded});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Atividade"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: ActivityForm(),
      ),
    );
  }

}