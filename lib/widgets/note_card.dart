import 'package:flutter/material.dart';

import '../domain/models/note.dart';


class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onPin;

  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
    required this.onDelete,
    required this.onPin,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // لون المذكرة
              Container(
                width: 8,
                height: 75,
                decoration: BoxDecoration(
                  color: note.color,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(width: 12),

              // محتوى المذكرة
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            note.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        if (note.isPinned)
                          const Icon(
                            Icons.push_pin,
                            size: 20,
                            color: Colors.orange,
                          ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Text(
                      note.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              // القائمة
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'pin') {
                    onPin();
                  }

                  if (value == 'delete') {
                    onDelete();
                  }
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'pin',
                      child: Text(
                        note.isPinned
                            ? 'إلغاء التثبيت'
                            : 'تثبيت',
                      ),
                    ),

                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('حذف'),
                    ),
                  ];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}