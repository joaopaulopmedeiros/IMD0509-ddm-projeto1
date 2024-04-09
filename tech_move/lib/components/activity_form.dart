import 'package:flutter/material.dart';

class ActivityForm extends StatefulWidget {
  const ActivityForm({super.key});

  @override
  _ActivityFormState createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Activity Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the activity name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Activity Score',
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the activity score';
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
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}