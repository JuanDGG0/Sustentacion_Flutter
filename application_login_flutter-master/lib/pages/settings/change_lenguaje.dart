import 'package:flutter/material.dart';
import '../../data/notifiers.dart';

final List<String> lenguages = [
  "español",
  "Français",
  "Italiano",
  "English",
  "Japan",
  "日本語",
  "中國人"
];

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: currentLenguage,
        builder: (context, currLen, _) {
          return ListView.builder(
            itemCount: lenguages.length,
            itemBuilder: (context, index) {
              final lang = lenguages[index];
              return RadioListTile<String>(
                title: Text(lang),
                value: lang,
                groupValue: currLen,
                onChanged: (String? value) {
                  if (value != null) {
                    currentLenguage.value = value;
                    Navigator.pop(context);
                  }
                },
              );
            },
          );
        });
  }
}
