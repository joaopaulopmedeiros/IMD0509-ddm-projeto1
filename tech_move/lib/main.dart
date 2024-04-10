import 'package:flutter/material.dart';
import 'package:tech_move/components/ranking.dart';
import 'package:tech_move/models/User.dart';
import 'package:tech_move/models/activity.dart';
import 'package:tech_move/screens/add_activity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Move',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tech Move'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<User> users = [
      User(name: 'João Paulo Medeiros', score: 0),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Ranking(users: users),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddActivityScreen(
                      user: users[0],
                      onActivityAdded: (Activity activity) {
                        setState(() {
                          users[0].score += activity.category.score;
                        });
                      }
                    )),
          );
        },
        tooltip: 'Adicionar atividade',
        child: const Icon(Icons.add),
      ),
    );
  }
}
