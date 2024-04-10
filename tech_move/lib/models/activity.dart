import 'package:tech_move/models/activity_category.dart';

class Activity {
  final ActivityCategory category;
  final DateTime publishedAt;

  Activity({required this.category, required this.publishedAt});
}
