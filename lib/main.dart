import 'package:flutter/material.dart';
import 'package:feature_integration/chat/di/injection_container.dart' as di;
import 'package:feature_integration/chat/presentation/widgets/chat_list_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initChatDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Feature',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ChatListWidget(),
    );
  }
}

