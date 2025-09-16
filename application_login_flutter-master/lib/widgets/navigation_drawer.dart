import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String username;
  final Function(int) onItemSelected;
  final VoidCallback onLogout;
  final int currentIndex;

  const CustomDrawer({
    super.key,
    required this.username,
    required this.onItemSelected,
    required this.onLogout,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(context),
          _buildMenuItems(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.8),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            username,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'usuario@demo.com',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Column(
      children: [
        _buildListTile(
          context,
          Icons.home,
          'Inicio',
          0,
          currentIndex == 0,
        ),
        _buildListTile(
          context,
          Icons.person,
          'Mi Perfil',
          1,
          currentIndex == 1,
        ),
        _buildListTile(
          context,
          Icons.settings,
          'Configuración',
          2,
          currentIndex == 2,
        ),
        const Divider(),
        _buildListTile(
          context,
          Icons.notifications,
          'Notificaciones',
          3,
          currentIndex == 3,
        ),
        _buildListTile(
          context,
          Icons.help,
          'Ayuda',
          4,
          currentIndex == 4,
        ),
        _buildListTile(
          context,
          Icons.info,
          'Acerca de',
          5,
          currentIndex == 5,
        ),
        const Divider(),
        _buildLogoutTile(context),
      ],
    );
  }

  Widget _buildListTile(
    BuildContext context,
    IconData icon,
    String title,
    int index,
    bool isSelected,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? colorScheme.primary : colorScheme.onSurface,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? colorScheme.primary : colorScheme.onSurface,
        ),
      ),
      trailing: isSelected
          ? Icon(
              Icons.arrow_forward,
              color: colorScheme.primary,
              size: 20,
            )
          : null,
      onTap: () => onItemSelected(index),
      selected: isSelected,
      selectedTileColor: colorScheme.primary.withOpacity(0.1),
    );
  }

  Widget _buildLogoutTile(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.logout, color: Theme.of(context).colorScheme.error),
      title: Text(
        'Cerrar Sesión',
        style: TextStyle(
          color: Theme.of(context).colorScheme.error,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Cierra el drawer
        onLogout();
      },
    );
  }
}
