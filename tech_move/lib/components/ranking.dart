import 'package:flutter/material.dart';
import 'package:tech_move/models/User.dart';

class Ranking extends StatefulWidget {
  final List<User> users;

  const Ranking(
      {super.key,
      required this.users});
  @override
  State<StatefulWidget> createState() => _RankingState();
}
class _RankingState extends State<Ranking> {
  @override
  Widget build(BuildContext context) {
    var users = widget.users;
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
