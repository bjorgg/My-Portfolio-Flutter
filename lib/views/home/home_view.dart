import 'package:flutter/material.dart';
import 'package:myportfolio/widgets/left_col/left_col.dart';
import 'package:myportfolio/widgets/right_col/right_col.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:align_positioned/align_positioned.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);
  final String circle = 'circle.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Row(children: <Widget>[
          LeftCol(),
          RightCol(),
        ]),
        AlignPositioned(
          alignment: Alignment.bottomLeft,
          moveByChildWidth: -0.5,
          moveByContainerWidth: 0.6,
          moveByContainerHeight: -0.1,
          child: SvgPicture.asset(
            circle,
            semanticsLabel: 'circle',
            height: 360,
            width: 360,
          ),
        ),
      ]),
    );
  }
}
