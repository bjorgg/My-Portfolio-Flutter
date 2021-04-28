import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/constants/adaptiveSize.dart';
import 'package:myportfolio/constants/app_colors.dart';
import 'package:myportfolio/widgets/my_projects/my_projects.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_cursor/flutter_cursor.dart';
import 'package:flutter_svg/flutter_svg.dart';

const url =
    "https://www.linkedin.com/in/bj%C3%B6rg-gunnarsd%C3%B3ttir-456a76ab/";

class LeftCol extends StatelessWidget {
  final String logo = 'bg_logo.svg';

  final Function handleProjectOnTap;

  LeftCol({
    this.handleProjectOnTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(100, 40, 0, 40),
      decoration: BoxDecoration(color: desertStorm),
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 1,
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        HoverCursor(
          cursor: Cursor.pointer,
          child: RotatedBox(
            quarterTurns: 1,
            child: TextButton(
              child: Text(
                'Björg Gunnarsdóttir  LinkedIn',
                style: GoogleFonts.ubuntuMono(
                  fontSize: AdaptiveSize().getadaptiveSize(context, 18),
                ),
              ),
              style: TextButton.styleFrom(
                primary: merlin,
              ),
              onPressed: () {
                launch(url);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Projects',
                  style: TextStyle(
                    fontSize: AdaptiveSize().getadaptiveSize(context, 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: SvgPicture.asset(
                    logo,
                    semanticsLabel: 'bg logo',
                    width: AdaptiveSize().getadaptiveSize(context, 105),
                  ),
                ),
              ]),
        ),
        Expanded(
          child: MyProjects(
            handleProjectOnTap: handleProjectOnTap,
          ),
        ),
      ]),
    );
  }
}
