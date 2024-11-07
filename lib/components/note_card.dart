import 'package:blocodenotas/models/note_model.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatefulWidget {
  final NoteModel note;
  final Function onDelete;
  final Function onEdit;

  const NoteCard({
    Key? key,
    required this.note,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: const CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.note, color: Colors.white),
        ),
        title: Text(
          widget.note.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          widget.note.content,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => widget.onDelete(),
        ),
        onTap: () => widget.onEdit(), // Ao clicar na nota, abre para edição
      ),
    );
  }
}
