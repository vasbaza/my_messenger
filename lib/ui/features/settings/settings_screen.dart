import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_messanger/models/app_state.dart';
import 'package:my_messanger/ui/features/settings/edit_name_screen.dart';
import 'package:my_messanger/ui/features/settings/settings_screen_view_model.dart';
import 'package:my_messanger/ui/resources/app_colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SettingsScreenViewModel>(
        converter: (store) {
      return SettingsScreenViewModel(
        store,
      );
    }, builder: (BuildContext context, SettingsScreenViewModel vm) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: const Text('Your name:'),
                subtitle: Text(vm.state.name),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            EditNameScreen(vm: vm, name: vm.state.name),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
