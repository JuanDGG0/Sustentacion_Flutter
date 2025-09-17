import 'package:flutter/material.dart';
import 'pages/splash/splash_app.dart';
import './theme/theme_app.dart';
import 'data/notifiers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isUsingDarkTheme,
      builder: (context, isDark, _) {
        return MaterialApp(
          title: 'Flutter Demo App',
          debugShowCheckedModeBanner: false,
          
          // Usa los temas personalizados
          theme: CustomTheme.lightTheme(),
          darkTheme: CustomTheme.darkTheme(),
          
          // Cambia dinámicamente según el switch de Configuración
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

          home: const SplashScreen(),
        );
      },
    );
  }
}
