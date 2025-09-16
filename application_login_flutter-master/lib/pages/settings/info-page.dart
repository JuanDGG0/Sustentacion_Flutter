import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final String title;
  final Widget child;

  const InfoPage({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: const BackButton(), // Flecha para regresar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
