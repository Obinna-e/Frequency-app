import 'package:flutter/foundation.dart';

class Task {
  final String id;
  final String title;
  final double img;
  final DateTime date;

  Task({
    @required this.id,
    @required this.title,
    this.img,
    this.date,
  });
}
