import 'package:flutter/material.dart';
import 'package:tech_move/components/ranking.dart';
import 'package:tech_move/models/user.dart';
import 'package:tech_move/models/activity.dart';
import 'package:tech_move/screens/about.dart';
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
  User user = User(name: 'João Paulo Medeiros', score: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Sobre'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Ranking(users: [user]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddActivityScreen(
                user: user,
                onActivityAdded: (Activity? newActivity) {
                  if (newActivity != null) {
                    setState(() {
                      user.score += newActivity.category.score;
                    });
                  }
                },
              ),
            ),
          );
        },
        tooltip: 'Adicionar atividade',
        child: const Icon(Icons.add),
      ),
    );
  }
}
