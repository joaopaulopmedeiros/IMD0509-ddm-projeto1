
import 'package:flutter/material.dart';
import 'package:tech_move/components/activity_form.dart';
import 'package:tech_move/models/User.dart';
import 'package:tech_move/models/activity.dart';

class AddActivityScreen extends StatelessWidget {
  final User user;
  final Function(Activity) onActivityAdded;

  const AddActivityScreen({super.key, required this.user, required this.onActivityAdded});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Atividade"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ActivityForm(
          onActivityAdded: onActivityAdded,
          user: user
        ),
      ),
    );
  }
}
