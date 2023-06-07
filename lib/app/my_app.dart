import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/providers/dark_theme_provider.dart';
import 'package:my_portfolio/routes/app_router.dart';

class MyApp extends ConsumerWidget {
  MyApp({super.key});
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Sam Baraka <> Software Engineer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness:
              ref.watch(darkThemeProvider) ? Brightness.dark : Brightness.light,
          primarySwatch: Colors.pink,
          useMaterial3: true),
      routerConfig: appRouter.config(),
    );
  }
}
