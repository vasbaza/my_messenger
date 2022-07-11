import 'package:flutter/material.dart';
import 'package:my_messanger/ui/features/settings/settings_screen.dart';

class HomeScreenAppBar extends StatelessWidget {
  final String name;

  const HomeScreenAppBar({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text('Welcome Home,\n$name!'),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
