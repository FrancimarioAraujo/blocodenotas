import 'package:blocodenotas/models/note_model.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Dá uma sombra para criar profundidade
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Cantos arredondados
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: const CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.note, color: Colors.white), // Ícone da nota
        ),
        title: Text(
          note.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          note.content,
          maxLines: 2, // Limita o texto a 2 linhas
          overflow:
              TextOverflow.ellipsis, // Adiciona '...' se o texto for maior
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => onDelete(),
        ),
        onTap: () => onEdit(), // Ao clicar na nota, abre para edição
      ),
    );
  }
}
