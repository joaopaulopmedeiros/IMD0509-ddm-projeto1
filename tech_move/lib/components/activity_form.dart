import 'package:flutter/material.dart';
import 'package:tech_move/models/activity_category.dart';

class AddActivityScreen extends StatelessWidget {
  const AddActivityScreen({super.key});

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

class ActivityForm extends StatefulWidget {
  const ActivityForm({super.key});

  @override
  _ActivityFormState createState() => _ActivityFormState();
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
                child: Text(category.name),
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
                // If the form is valid, redirect to the home screen
                Navigator.pop(context, true);
              }
            },
            child: const Text('Finalizar'),
          ),
        ],
      ),
    );
  }
}
