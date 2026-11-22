import 'package:flutter/material.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';

/// Scaffold pembungkus seluruh layar dengan latar gradien ungu dan batas lebar 640 dp.
class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? topBar;
  final Widget? bottomBar;
  final bool scrollable;

  const AppScaffold({
    super.key,
    required this.body,
    this.topBar,
    this.bottomBar,
    this.scrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = body;
    if (scrollable) {
      content = SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: content,
      );
    } else {
      content = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: content,
      );
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.gradientStart,
              AppColors.gradientEnd,
            ],
          ),
        ),
        child: Listener(
          behavior: HitTestBehavior.translucent,
          onPointerDown: (_) {
            AudioService.instance.unlockAndPlayBgm();
          },
          child: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: Column(
                  children: [
                    ?topBar,
                    Expanded(child: content),
                    ?bottomBar,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
