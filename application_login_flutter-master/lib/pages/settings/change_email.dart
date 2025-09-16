import 'package:flutter/material.dart';
import '../../data/notifiers.dart';

class ChangeEmailForm extends StatefulWidget {
  const ChangeEmailForm({super.key});

  @override
  State<ChangeEmailForm> createState() => _ChangeEmailFormState();
}

String? _emailValidator(String? value) {
  if (value == null || value.trim().isEmpty) return 'Ingresa un correo';
  final email = value.trim();
  final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  if (!emailRegex.hasMatch(email)) return 'Ingresa un correo válido';
  return null;
}

class _ChangeEmailFormState extends State<ChangeEmailForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController newMailController = TextEditingController();

  @override
  void dispose() {
    newMailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
              controller: newMailController,
              decoration: const InputDecoration(labelText: 'New Mail'),
              validator: _emailValidator),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).pop();

                mailNotifier.value =
                    newMailController.text;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Email changed successfully!')),
                );
              }
            },
            child: const Text('Change'),
          ),
        ],
      ),
    );
  }
}
