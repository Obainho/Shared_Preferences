import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preference/models/settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          const ListTile(
            title: Text(
              "Theme",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Card(
            child: Consumer<ThemeSettings>(
              builder: (context, value, child) {
                return SwitchListTile(
                  value: value.darkTheme,
                  onChanged: (newvalue) {
                    value.toggleTheme();
                  },
                  title: const Text(
                    "Dark theme",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
