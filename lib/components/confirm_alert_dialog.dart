import 'package:flutter/material.dart';

class ConfirmAlertDialog extends StatefulWidget {
  String title;
  String description;
  ConfirmAlertDialog(
      {super.key, required this.title, required this.description});

  @override
  State<ConfirmAlertDialog> createState() => _ConfirmAlertDialogState();
}

class _ConfirmAlertDialogState extends State<ConfirmAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Text(widget.description),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true); // Sair
          },
          child: const Text(
            'Confirmar',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
