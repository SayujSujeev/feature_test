import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:feature_integration/chat/di/injection_container.dart' as di;
import 'package:feature_integration/chat/presentation/widgets/chat_list_widget.dart';
import 'package:feature_integration/core/core.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        fontFamily: AppConstants.fontFamily,
        // Status bar configuration
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromRGBO(235, 158, 4, 1),
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      home: const ChatListWidget(),
    );
  }
}

