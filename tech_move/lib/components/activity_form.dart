import 'package:flutter/material.dart';
import 'package:tech_move/models/user.dart';
import 'package:tech_move/models/activity.dart';
import 'package:tech_move/models/activity_category.dart';

class ActivityForm extends StatefulWidget {
  final Function(Activity) onActivityAdded;
  final User user;

  const ActivityForm({super.key, required this.onActivityAdded, required this.user});

  @override
  State<ActivityForm> createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  final _formKey = GlobalKey<FormState>();
  ActivityCategory? _selectedCategory;
  final List<ActivityCategory> _categories = [
    ActivityCategory(id: 1, name: "Comer fruta", score: 10),
    ActivityCategory(id: 2, name: "Atividade física", score: 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<ActivityCategory>(
            value: _selectedCategory,
            decoration: const InputDecoration(
              labelText: 'Categoria',
            ),
            items: _categories.map((category) {
              return DropdownMenuItem<ActivityCategory>(
                value: category,
                child: Text("${category.name} - ${category.score} pontos"),
              );
            }).toList(),
            onChanged: (ActivityCategory? value) {
              setState(() {
                _selectedCategory = value;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Por favor, selecione uma categoria';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final newActivity = Activity(category: _selectedCategory!, publishedAt: DateTime.now());
                widget.onActivityAdded(newActivity);
                Navigator.pop(context);
              }
            },
            child: const Text('Finalizar'),
          ),
        ],
      ),
    );
  }
}

