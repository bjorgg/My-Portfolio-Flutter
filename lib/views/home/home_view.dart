import 'package:flutter/material.dart';
import 'package:flutter_cursor/flutter_cursor.dart';
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
      padding: const EdgeInsets.fromLTRB(30, 30, 16, 12),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 1,
      child: Column(children: <Widget>[
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              handleProjectOnTap(null);
            },
            child: Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(backArrow, semanticsLabel: 'back arrow'),
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Stack(children: <Widget>[
            Draggable(
              childWhenDragging: Container(),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  decoration: BoxDecoration(color: merlin),
                  child: Image(
                    image: AssetImage(image),
                  ),
                ),
              ),
              feedback: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding: const EdgeInsets.all(32.0),
                decoration: BoxDecoration(color: merlin),
                child: Image(
                  image: AssetImage(image),
                ),
              ),
            ),
            Draggable(
              childWhenDragging: Container(),
              child: AlignPositioned(
                alignment: Alignment.topLeft,
                moveByChildHeight: 0.2,
                moveByChildWidth: 0.1,
                child: Container(
                  padding: const EdgeInsets.all(60.0),
                  decoration: BoxDecoration(color: merlin),
                  child: SvgPicture.asset(
                    logo,
                    semanticsLabel: 'project logo',
                    width: AdaptiveSize().getadaptiveSize(context, 360),
                  ),
                ),
              ),
              feedback: Container(
                padding: const EdgeInsets.all(60.0),
                decoration: BoxDecoration(color: merlin),
                child: SvgPicture.asset(
                  logo,
                  semanticsLabel: 'project logo',
                  width: AdaptiveSize().getadaptiveSize(context, 360),
                ),
              ),
            ),
            Draggable(
              childWhenDragging: Container(),
              child: AlignPositioned(
                alignment: Alignment.bottomCenter,
                moveByChildHeight: -0.1,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(color: merlin),
                    child: Text(
                      description,
                      style: TextStyle(
                          fontSize: AdaptiveSize().getadaptiveSize(context, 26),
                          color: desertStorm),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              feedback: Material(
                child: Container(
                  width: AdaptiveSize().getadaptiveSize(context, 600),
                  padding: const EdgeInsets.all(40.0),
                  decoration: BoxDecoration(color: merlin),
                  child: Text(
                    description,
                    style: TextStyle(
                        fontSize: AdaptiveSize().getadaptiveSize(context, 26),
                        color: desertStorm),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ]),
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
          ),
        ),
      ]),
    );
  }
}

// class ProjectInfo extends StatefulWidget {
//   const ProjectInfo({
//     @required this.logo,
//     @required this.description,
//     @required this.image,
//     @required this.github,
//     @required this.livesite,
//     this.handleProjectOnTap,
//   });
//   final String logo;
//   final String description;
//   final String image;
//   final String github;
//   final String livesite;
//   final Function handleProjectOnTap;

//   @override
//   _ProjectInfoState createState() => _ProjectInfoState();
// }

// class _ProjectInfoState extends State<ProjectInfo> {
//   final String backArrow = 'back_arrow.svg';

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(30, 30, 16, 12),
//       width: MediaQuery.of(context).size.width * 0.4,
//       height: MediaQuery.of(context).size.height * 1,
//       child: Column(children: <Widget>[
//         Expanded(
//           flex: 1,
//           child: InkWell(
//             onTap: () {
//               widget.handleProjectOnTap(null);
//             },
//             child: Align(
//               alignment: Alignment.topLeft,
//               child: SvgPicture.asset(backArrow, semanticsLabel: 'back arrow'),
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 10,
//           child: Stack(children: <Widget>[
//             Align(
//               alignment: Alignment.bottomRight,
//               child: Container(
//                 padding: const EdgeInsets.all(32.0),
//                 decoration: BoxDecoration(color: merlin),
//                 child: Image(
//                   image: AssetImage(widget.image),
//                 ),
//               ),
//             ),
//             AlignPositioned(
//               alignment: Alignment.topLeft,
//               moveByChildHeight: 0.2,
//               moveByChildWidth: 0.1,
//               child: Container(
//                 padding: const EdgeInsets.all(60.0),
//                 decoration: BoxDecoration(color: merlin),
//                 child: SvgPicture.asset(
//                   widget.logo,
//                   semanticsLabel: 'project logo',
//                   width: AdaptiveSize().getadaptiveSize(context, 360),
//                 ),
//               ),
//             ),
//             AlignPositioned(
//                 alignment: Alignment.bottomCenter,
//                 moveByChildHeight: -0.1,
//                 child: FractionallySizedBox(
//                   widthFactor: 0.8,
//                   child: Container(
//                     padding: const EdgeInsets.all(40.0),
//                     decoration: BoxDecoration(color: merlin),
//                     child: Text(
//                       widget.description,
//                       style: TextStyle(
//                           fontSize: AdaptiveSize().getadaptiveSize(context, 26),
//                           color: desertStorm),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 )),
//           ]),
//         ),
//         Expanded(
//           flex: 1,
//           child: Align(
//             alignment: Alignment.bottomRight,
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   TextButton(
//                     child: Text(
//                       'Project on GitHub',
//                       style: GoogleFonts.ubuntuMono(
//                         fontSize: AdaptiveSize().getadaptiveSize(context, 20),
//                       ),
//                     ),
//                     style: TextButton.styleFrom(
//                       primary: merlin,
//                     ),
//                     onPressed: () {
//                       launch(widget.github);
//                     },
//                   ),
//                   TextButton(
//                     child: Text(
//                       'Live version',
//                       style: GoogleFonts.ubuntuMono(
//                         fontSize: AdaptiveSize().getadaptiveSize(context, 20),
//                       ),
//                     ),
//                     style: TextButton.styleFrom(
//                       primary: merlin,
//                     ),
//                     onPressed: () {
//                       launch(widget.livesite);
//                     },
//                   ),
//                 ]),
//           ),
//         ),
//       ]),
//     );
//   }
// }
