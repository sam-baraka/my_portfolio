import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonAppBar extends ConsumerWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        height: 50,
        child: DefaultTabController(
          length: 5,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Image.asset('assets/logo.jpeg'),
              const Expanded(
                child: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                      text: 'Home',
                    ),
                    Tab(
                      text: 'About',
                    ),
                    Tab(
                      text: 'Skills',
                    ),
                    Tab(
                      text: 'Projects',
                    ),
                    Tab(
                      text: 'Contact',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
