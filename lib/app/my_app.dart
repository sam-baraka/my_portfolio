import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/routes/app_router.dart';

class MyApp extends ConsumerWidget {
  MyApp({super.key});
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'My Portfolio',
      theme: ThemeData(
          // Use material 3 with Pink and purple theme
          colorScheme: const ColorScheme.light(
            primary: Color(0xFFE91E63),
            secondary: Color(0xFF9C27B0),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFE91E63),
          ),
          useMaterial3: true),
      routerConfig: appRouter.config(),
    );
  }
}
