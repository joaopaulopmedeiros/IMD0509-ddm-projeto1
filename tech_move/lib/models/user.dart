import 'package:tech_move/models/activity.dart';

class User {
  final String name;
  double score;
  final List<Activity> activities;

  User({required this.name, required this.score, this.activities = const []});
}
