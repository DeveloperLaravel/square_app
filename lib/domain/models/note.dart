import 'package:flutter/material.dart';

class Note{
  final int id;
  String title;
  String content;
  Color color;
  bool isPinned;
  DateTime createdAt;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.color,
    this.isPinned = false,
    required this.createdAt,
  });
  }