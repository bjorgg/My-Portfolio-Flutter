import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/constants/adaptiveSize.dart';
import 'package:myportfolio/constants/app_colors.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolio/widgets/my_projects/my_projects.dart';
import 'package:url_launcher/url_launcher.dart';

class RightCol extends StatelessWidget {
  final int counter;
  final List<Project> projectInfo;
  RightCol({Key key, this.counter, this.projectInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 70, 50, 60),
      decoration: BoxDecoration(color: bittersweet),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 1,
      child: Stack(children: <Widget>[
        Text(
          'Hello. \nI am a graphic media designer and a web development student living in Reykjavík. \n\nThis is my portfolio with my web development projects, the portfolio itself is one of those projects in which I explore brutalism and the Flutter framework.',
          style: TextStyle(
              fontSize: AdaptiveSize().getadaptiveSize(context, 36),
              color: desertStorm),
          textAlign: TextAlign.center,
        ),
        // Visibility(
        //   // if data then true else false
        //   visible: !projectInfo ? true : false,
        //   child: _ProjectInfo(
        //     image: 'Stofan_img.png',
        //     description: 'projectToDisplay.description',
        //     logo: 'Stofan_logo.svg',
        //     github: 'projectToDisplay.github',
        //     livesite: 'projectToDisplay.livesite',
        //   ),
        // ),
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
  // final VoidCallback onTap;

  const _ProjectInfo({
    Key key,
    @required this.logo,
    @required this.description,
    @required this.image,
    @required this.github,
    @required this.livesite,
    // @required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        // GestureDetector(
        //   onTap: (bool) => setState(() {
        //     _shouldShow = false;
        //   }), // Set state to false here instead of ontap value
        // Add hover effect here
        // child:
        SvgPicture.asset(backArrow, semanticsLabel: 'back arrow'),
        // ),
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
