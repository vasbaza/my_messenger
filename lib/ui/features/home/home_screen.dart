import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_messanger/actions/actions.dart';
import 'package:my_messanger/models/app_state.dart';
import 'package:my_messanger/ui/features/home/home_screen_view_model.dart';
import 'package:my_messanger/ui/features/home/widgets/dismissed_card_background.dart';
import 'package:my_messanger/ui/features/home/widgets/message_card.dart';
import 'package:my_messanger/ui/features/settings/settings_screen.dart';
import 'package:my_messanger/ui/resources/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool canSendMessage = false;
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_messageControllerListener);
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _messageControllerListener() {
    setState(() {
      canSendMessage = _messageController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeScreenViewModel>(
      converter: (store) {
        return HomeScreenViewModel(
          store,
        );
      },
      builder: (BuildContext context, HomeScreenViewModel vm) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text('Welcome Home,\n${vm.state.name}!'),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: onTapSettings,
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: vm.state.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.separated(
                            itemCount: vm.state.messages.length,
                            itemBuilder: (BuildContext context, int index) {
                              final messages = vm.state.messages;
                              final message = messages[index];
                              return Dismissible(
                                background: const DismissedCardBackground(),
                                key: ValueKey<int>(message.hashCode),
                                child: MessageCard(
                                  message: message,
                                ),
                                onDismissed: (_) {
                                  messages.remove(message);
                                  vm.onDeleteMessage(message);
                                },
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 8);
                            },
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            onSubmitted: (String text) => onSendMessage(vm),
                          ),
                        ),
                        IconButton(
                          onPressed: () => onSendMessage(vm),
                          icon: Icon(
                            Icons.send,
                            color: canSendMessage
                                ? AppColors.active
                                : AppColors.inactive,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void onTapSettings() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  void onSendMessage(HomeScreenViewModel vm) {
    if (canSendMessage) {
      vm.onSendMessage(_messageController.text);
      _messageController.clear();
    }
  }
}
