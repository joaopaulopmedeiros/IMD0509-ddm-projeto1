
import 'package:flutter/material.dart';

class AddActivityScreen extends StatelessWidget {
  const AddActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Atividade"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text('Next'),
        ),
      ),
    );
  }

}