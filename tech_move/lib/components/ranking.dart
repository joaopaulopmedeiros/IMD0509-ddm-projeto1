import 'package:flutter/material.dart';
import 'package:tech_move/models/User.dart';

class Ranking extends StatelessWidget {
  const Ranking({super.key});

  @override
  Widget build(BuildContext context) {
    final List<User> users = [
      User(name: 'Alice', score: 150),
      User(name: 'Bob', score: 200),
      User(name: 'Charlie', score: 180),
      User(name: 'David', score: 220),
      User(name: 'Emma', score: 190),
      User(name: 'Frank', score: 160),
    ];
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ranking',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text((index + 1).toString()),
                    ),
                    title: Text(users[index].name),
                    trailing: Text(
                      users[index].score.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
  }

}