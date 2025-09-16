import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import '../../data/notifiers.dart';
import 'change_lenguaje.dart';
import 'info-page.dart';
import 'change_email.dart';
import 'change_password.dart';

class ConfigContent extends StatelessWidget {
  const ConfigContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Configuración de Usuario',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ValueListenableBuilder<bool>(
                  valueListenable: isUsingDarkTheme,
                  builder: (context, isDark, _) {
                    return SettingsList(
                      sections: [
                        SettingsSection(
                          title: const Text('Información de cuenta'),
                          tiles: <SettingsTile>[
                            SettingsTile.navigation(
                              leading: const Icon(Icons.mail),
                              title: const Text("Cambiar correo"),
                              value: ValueListenableBuilder(
                                valueListenable: mailNotifier,
                                builder: (context, mail, _) => Text(mail),
                              ),
                              onPressed: (context) {
                                showChangeEmail(context);
                              },
                            ),
                            SettingsTile.navigation(
                              leading: const Icon(Icons.lock),
                              title: const Text('Cambiar contraseña'),
                              onPressed: (context) {
                                showChangePassword(context);
                              },
                            ),
                          ],
                        ),
                        SettingsSection(
                          title: const Text("Personalización"),
                          tiles: [
                            SettingsTile.switchTile(
                              onToggle: (value) {
                                isUsingDarkTheme.value = value;
                              },
                              initialValue: isDark,
                              leading: const Icon(Icons.format_paint),
                              title: const Text('Tema oscuro'),
                            ),
                            SettingsTile(
                              leading: const Icon(Icons.language),
                              title: const Text("Idioma"),
                              onPressed: (context) {
                                showChangeLanguage(context);
                              },
                              value: ValueListenableBuilder(
                                valueListenable: currentLenguage,
                                builder: (context, lenguage, _) => Text(lenguage),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showChangeEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InfoPage(
          title: "Cambiar Email",
          child: ChangeEmailForm(),
        ),
      ),
    );
  }

  void showChangePassword(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InfoPage(
          title: "Cambiar contraseña",
          child: ChangePasswordForm(),
        ),
      ),
    );
  }

  void showChangeLanguage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InfoPage(
          title: "Cambiar idioma",
          child: LanguageSelector(),
        ),
      ),
    );
  }
}
