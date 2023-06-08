import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:my_portfolio/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureApp();
  runApp(ProviderScope(child: MyApp()));
}

void configureApp() {
  // Register the PathUrlStrategy for web
  setUrlStrategy(PathUrlStrategy());
}
