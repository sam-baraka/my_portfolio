import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/const/constants.dart';
import 'package:my_portfolio/home_page/moving_widgets.dart';
import 'package:my_portfolio/routes/app_router.gr.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/dark_theme_provider.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  final String mediumUrl = 'https://medium.com/@sababuvercetti';
  final String youtubeUrl =
      'https://www.youtube.com/channel/UCqrK_qUx6OZWxjHOVmZ8Pyg';
  final String linkedinUrl = 'https://www.linkedin.com/in/sam-baraka/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: FaIcon(ref.watch(darkThemeProvider)
                ? FontAwesomeIcons.sun
                : FontAwesomeIcons.moon),
            onPressed: () {
              ref.read(darkThemeProvider.notifier).toggleTheme();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ShaderMask(
                  blendMode: BlendMode.dstIn,
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Colors.transparent, Colors.black],
                      stops: [0.001, 1.0],
                    ).createShader(bounds);
                  },
                  child: AnimatedCrossFade(
                    firstChild: Image.asset(
                      'assets/photo_light.jpeg',
                    ),
                    secondChild: Image.asset(
                      'assets/photo_dark.jpeg',
                    ),
                    crossFadeState: ref.watch(darkThemeProvider)
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(seconds: 1),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                          'Samuel Baraka',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SelectableText(
                          'Software Engineer',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SelectableText(
                          MyConstants.welcomeText,
                          style: Theme.of(context).textTheme.titleLarge,
                          // overflow: TextOverflow.clip,
                          // softWrap: true,
                          maxLines: 5,
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'My Skills',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        InkWell(
                          onTap: () {
                            AutoRouter.of(context).push(const SkillsRoute());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const FlutterLogo(size: 50),
                              Image.asset('assets/angular.png', width: 50),
                              Image.asset('assets/c-sharp.png', width: 50),
                              Image.asset('assets/netcore.png', width: 50),
                              Image.asset('assets/swift.png', width: 50),
                              Image.asset('assets/kotlin.png', width: 50),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.medium),
                    onPressed: () {
                      launchUrl(Uri.parse(mediumUrl));
                    },
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.youtube,
                      color: !ref.watch(darkThemeProvider)
                          ? const Color(0xFFFF0000)
                          : null,
                    ),
                    onPressed: () {
                      launchUrl(Uri.parse(youtubeUrl));
                    },
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: !ref.watch(darkThemeProvider)
                          ? const Color(0xFF0077B5)
                          : null,
                    ),
                    onPressed: () {
                      launchUrl(Uri.parse(linkedinUrl));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
