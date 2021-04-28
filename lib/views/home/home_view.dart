import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/constants/adaptiveSize.dart';
import 'package:myportfolio/constants/app_colors.dart';
import 'package:myportfolio/widgets/left_col/left_col.dart';
import 'package:myportfolio/widgets/my_projects/my_projects.dart';
import 'package:myportfolio/widgets/right_col/right_col.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:align_positioned/align_positioned.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String circle = 'circle.svg';
  Project projectInfo;

  void handleProjectOnTap(newProjectInfo) {
    setState(() {
      projectInfo = newProjectInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Row(children: <Widget>[
          LeftCol(
            handleProjectOnTap: handleProjectOnTap,
          ),
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
            width: AdaptiveSize().getadaptiveSize(context, 360),
          ),
        ),
        if (projectInfo.runtimeType != Null)
          Align(
            alignment: Alignment.topRight,
            child: _ProjectInfo(
              handleProjectOnTap: handleProjectOnTap,
              image: projectInfo.image,
              description: projectInfo.description,
              logo: projectInfo.logo,
              github: projectInfo.github,
              livesite: projectInfo.livesite,
            ),
          ),
      ]),
    );
  }
}

class _ProjectInfo extends StatelessWidget {
  final String backArrow = 'back_arrow.svg';
  final String logo;
  final String description;
  final String image;
  final String github;
  final String livesite;
  final Function handleProjectOnTap;

  const _ProjectInfo({
    Key key,
    @required this.logo,
    @required this.description,
    @required this.image,
    @required this.github,
    @required this.livesite,
    this.handleProjectOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 70, 50, 60),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 1,
      child: Column(children: <Widget>[
        InkWell(
          onTap: () {
            handleProjectOnTap(null);
          },
          child: SvgPicture.asset(backArrow, semanticsLabel: 'back arrow'),
        ),
        Stack(children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(color: merlin),
            child: Image(image: AssetImage(image)),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(color: merlin),
            child: Text(description),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(color: merlin),
            child: SvgPicture.asset(logo, semanticsLabel: 'project logo'),
          ),
        ]),
        Row(children: <Widget>[
          TextButton(
            child: Text(
              'Project on GitHub',
              style: GoogleFonts.ubuntuMono(
                fontSize: AdaptiveSize().getadaptiveSize(context, 20),
              ),
            ),
            style: TextButton.styleFrom(
              primary: merlin,
            ),
            onPressed: () {
              launch(github);
            },
          ),
          TextButton(
            child: Text(
              'Live version',
              style: GoogleFonts.ubuntuMono(
                fontSize: AdaptiveSize().getadaptiveSize(context, 20),
              ),
            ),
            style: TextButton.styleFrom(
              primary: merlin,
            ),
            onPressed: () {
              launch(livesite);
            },
          ),
        ]),
      ]),
    );
  }
}
