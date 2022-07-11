import 'package:flutter/material.dart';
import 'package:my_messanger/ui/features/settings/settings_screen_view_model.dart';
import 'package:my_messanger/ui/resources/app_colors.dart';

class EditNameScreen extends StatefulWidget {
  final String name;
  final SettingsScreenViewModel vm;

  const EditNameScreen({
    Key? key,
    required this.vm,
    required this.name,
  }) : super(key: key);

  @override
  State<EditNameScreen> createState() => _EditNameScreenState();
}

class _EditNameScreenState extends State<EditNameScreen> {
  bool canChangeName = false;
  final _nameController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _nameController.addListener(_nameControllerListener);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _nameControllerListener() {
    setState(() {
      canChangeName = _nameController.text.isNotEmpty && focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Name'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Your name:"),
              TextField(
                focusNode: focusNode,
                autofocus: false,
                controller: _nameController,
                onSubmitted: (String value) => onSubmitName(),
              ),
              TextButton(
                onPressed: onSubmitName,
                child: Text(
                  'Submit',
                  style: TextStyle(
                      color: canChangeName
                          ? AppColors.primary
                          : AppColors.inactive),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSubmitName() {
    if (canChangeName) {
      focusNode.unfocus();
      widget.vm.onSubmitName(_nameController.text);
      Navigator.of(context).pop();
    }
  }
}
