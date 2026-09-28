import 'package:flutter/material.dart';

import '../data/notes_data.dart';
import '../widgets/note_card.dart';
import 'add_note_screen.dart';
import 'domain/models/note.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  String searchQuery = '';

  List<Note> get filteredNotes {
    if (searchQuery.isEmpty) {
      return notes;
    }

    return notes.where((note) {
      return note.title
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          note.content
              .toLowerCase()
              .contains(searchQuery.toLowerCase());
    }).toList();
  }

  Future<void> addNote() async {
    final note = await Navigator.push<Note>(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const AddNoteScreen();
        },
      ),
    );

    if (note != null) {
      setState(() {
        notes.insert(0, note);
      });
    }
  }

  Future<void> editNote(Note note) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddNoteScreen(note: note);
        },
      ),
    );

    setState(() {});
  }

  void deleteNote(Note note) {
    setState(() {
      notes.removeWhere(
        (item) => item.id == note.id,
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم حذف المذكرة'),
      ),
    );
  }

  void togglePin(Note note) {
    setState(() {
      note.isPinned = !note.isPinned;

      notes.sort((a, b) {
        if (a.isPinned && !b.isPinned) {
          return -1;
        }

        if (!a.isPinned && b.isPinned) {
          return 1;
        }

        return 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentNotes = filteredNotes;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'مذكراتي',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: addNote,
              icon: const Icon(Icons.add),
            ),
          ],
        ),

        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                10,
                16,
                16,
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'البحث في المذكرات...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            Expanded(
              child: currentNotes.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.note_alt_outlined,
                            size: 70,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'لا توجد مذكرات',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      itemCount: currentNotes.length,
                      itemBuilder: (context, index) {
                        final note = currentNotes[index];

                        return NoteCard(
                          note: note,

                          onTap: () {
                            editNote(note);
                          },

                          onDelete: () {
                            deleteNote(note);
                          },

                          onPin: () {
                            togglePin(note);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: addNote,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}