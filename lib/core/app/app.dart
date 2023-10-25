import '../theme/sh_theme.dart';
import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';
import '../../features/home/presentation/screens/home_screen.dart';

class SmartHomeApp extends StatelessWidget {
  const SmartHomeApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SmartHome',
          theme: SHTheme.dark,
          home: const HomeScreen(),
        ),
      );
}
