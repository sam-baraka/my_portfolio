import 'package:flutter_riverpod/flutter_riverpod.dart';

final darkThemeProvider =
    StateNotifierProvider<DarkThemeProviderNotifier, bool>((ref) {
  return DarkThemeProviderNotifier();
});

class DarkThemeProviderNotifier extends StateNotifier<bool> {
  DarkThemeProviderNotifier() : super(false);

  void toggleTheme() {
    state = !state;
  }
}
