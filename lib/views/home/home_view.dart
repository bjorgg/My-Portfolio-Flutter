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
import 'package:flutter/foundation.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String circle = 'assets/circle.svg';
  // projectInfo object of type Project
  Project projectInfo;

  // Setting the state of the HomeView when a project is tapped
  // Displays the project info
  void handleProjectOnTap(newProjectInfo) {
    setState(() {
      projectInfo = newProjectInfo;
    });
  }

  // The build method of the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // Stack widget to stack items on top of each other
        child: Stack(children: <Widget>[
          Row(children: <Widget>[
            // Passing the handleProjectOnTap function down to LeftCol widget
            LeftCol(
              handleProjectOnTap: handleProjectOnTap,
            ),
            RightCol(),
          ]),
          // Circle vector and its alignment, aligning its center
          // to the meeting of left and right column
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
          // If there is project info dispaly it on top of right column
          if (projectInfo.runtimeType != Null)
            Align(
              alignment: Alignment.topRight,
              // Passing and receving props in project info
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
      ),
    );
  }
}

// Building the project info
class _ProjectInfo extends StatelessWidget {
  // A variable with the final keyword will be initialized at runtime
  // and can only be assigned for a single time
  final String backArrow = 'assets/back_arrow.svg';
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
      // Getting the size of the screen and sizing the container
      // to bo 40% of its width and 100% of its height
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 1,
      child: Column(children: <Widget>[
        // Back arrow and its styling
        // Expanded widget expandes to the available space it has
        Expanded(
          flex: 1,
          // InkWell is a rectangular area of a Material that responds to touch
          child: InkWell(
            // When clicked set the projectInfo object to null
            onTap: () {
              handleProjectOnTap(null);
            },
            child: Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(backArrow, semanticsLabel: 'back arrow'),
            ),
          ),
        ),
        // Stack group of project info and its styling
        // the last item of a stack widget is on top
        Expanded(
          flex: 10,
          child: Stack(children: <Widget>[
            // Draggable widget, makes it child draggable
            Draggable(
              // childWhenDragging sets what will be the child when the
              // other is beign dragged, here it is an empty container
              childWhenDragging: Container(),
              // The image of project info and its placement and styling
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
              // feedback set what's displayed when dragging so
              // that's the image again and some styling
              feedback: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding: const EdgeInsets.all(32.0),
                decoration: BoxDecoration(color: merlin),
                child: Image(
                  image: AssetImage(image),
                ),
              ),
            ),
            // Next draggable item is the logo from project info
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
            // The last Draggable item is the project info description
            Draggable(
              childWhenDragging: Container(),
              child: AlignPositioned(
                alignment: Alignment.bottomCenter,
                moveByChildHeight: -0.1,
                // FractionallySizedBox to size in fraction to its parent
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
        // Links to github and live version of project and
        // its styling and placement
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
