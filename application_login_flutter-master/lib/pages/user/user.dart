import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';

class UserScreen extends StatelessWidget {
  final String username;
  final String password;

  const UserScreen({
    super.key,
    required this.username,
    required this.password,
  });

  // Validación de contraseña igual al formulario de registro
  bool _isPasswordValid(String password) {
    if (password.length < 8 || password.length > 16) {
      return false;
    }
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$');
    return regex.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    final bool isPasswordValid = _isPasswordValid(password);

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Perfil de Usuario',
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildInfoRow('Usuario:', username),
                    const SizedBox(height: 15),
                    _buildInfoRow('Email:', '$username@demo.com'),
                    const SizedBox(height: 15),
                    _buildInfoRow(
                      'Contraseña:',
                      '${'*' * password.length} (${password.length} caracteres)',
                    ),
                    if (!isPasswordValid)
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          '⚠ La contraseña no cumple con los requisitos de seguridad.',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método helper para mostrar la información en filas
  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
