import 'package:flutter/material.dart';
import 'package:myportfolio/constants/adaptiveSize.dart';
import 'package:myportfolio/constants/app_colors.dart';

class RightCol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 70, 50, 60),
      decoration: BoxDecoration(color: bittersweet),
      // Setting the size of the container according the screen size
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 1,
      // About me text
      child: Text(
        'Hello. \nI am a graphic media designer and a web development student living in Reykjavík. \n\nThis is my portfolio with my web development projects, the portfolio itself is one of those projects in which I explore brutalism and the Flutter framework.',
        style: TextStyle(
            fontSize: AdaptiveSize().getadaptiveSize(context, 36),
            color: desertStorm),
        textAlign: TextAlign.center,
      ),
    );
  }
}
