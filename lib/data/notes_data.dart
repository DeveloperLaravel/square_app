 import 'package:flutter/material.dart';

import '../domain/models/note.dart';

List<Note> notes = [
  Note(
    id: 1,
    title: 'تعلم Flutter',
    content: 'تعلم Widget و State و Build',
    color: Colors.blue,
    createdAt: DateTime.now(),
  ),

  Note(
    id: 2,
    title: 'مشروع المتجر',
    content: 'إنشاء شاشة المنتجات وسلة المشتريات',
    color: Colors.orange,
    isPinned: true,
    createdAt: DateTime.now(),
  ),

  Note(
    id: 3,
    title: 'أفكار جديدة',
    content: 'تطبيق إدارة المخزون وتطبيق المبيعات',
    color: Colors.green,
    createdAt: DateTime.now(),
  ),
  ];