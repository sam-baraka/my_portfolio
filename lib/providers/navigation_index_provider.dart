import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationIndexProvider =
    StateNotifierProvider<NavigationIndexProvider, int>((ref) {
  return NavigationIndexProvider();
});

class NavigationIndexProvider extends StateNotifier<int> {
  NavigationIndexProvider() : super(0);

  void changeIndex(int index) {
    state = index;
  }
}
