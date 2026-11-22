import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/boot_screen.dart';
import 'state/game_controller.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NetQuestApp());
}

class NetQuestApp extends StatelessWidget {
  const NetQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameController(),
      child: MaterialApp(
        title: 'NetQuest: Misi Jaringan Komputer',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        home: const BootScreen(),
      ),
    );
  }
}
