import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MovingWidgetsScreen extends StatefulWidget {
  @override
  _MovingWidgetsScreenState createState() => _MovingWidgetsScreenState();
}

class _MovingWidgetsScreenState extends State<MovingWidgetsScreen> {
  List<WidgetData> _widgetDataList = [];

  List<Widget> skillsIcons = [
    FaIcon(FontAwesomeIcons.angular),
    FaIcon(FontAwesomeIcons.html5),
    FaIcon(FontAwesomeIcons.css3),
    FlutterLogo(),
    FaIcon(FontAwesomeIcons.sass),
  ];

  @override
  void initState() {
    super.initState();
    createMovingWidgets();
    startMovingWidgets();
  }

  void createMovingWidgets() {
    for (int i = 0; i < 5; i++) {
      _widgetDataList.add(WidgetData(
        xPosition: Random().nextInt(200).toDouble(),
        yPosition: Random().nextInt(400).toDouble(),
        xDirection: Random().nextBool() ? 1 : -1,
        yDirection: Random().nextBool() ? 1 : -1,
      ));
    }
  }

  void startMovingWidgets() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        for (int i = 0; i < _widgetDataList.length; i++) {
          WidgetData widgetData = _widgetDataList[i];
          widgetData.xPosition += (1 * widgetData.xDirection);
          widgetData.yPosition += (1 * widgetData.yDirection);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _widgetDataList.map((widgetData) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 100),
          left: widgetData.xPosition,
          top: widgetData.yPosition,
          child: Transform.scale(
            scale: 1.5,
            child: Container(
              width: 50,
              height: 50,
              child: skillsIcons[_widgetDataList.indexOf(widgetData)],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class WidgetData {
  double xPosition;
  double yPosition;
  int xDirection;
  int yDirection;

  WidgetData({
    required this.xPosition,
    required this.yPosition,
    required this.xDirection,
    required this.yDirection,
  });
}
