import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myportfolio/constants/app_colors.dart';
import 'package:myportfolio/my_projects/my_projects.dart';
import 'package:url_launcher/url_launcher.dart';

const url = "https://www.linkedin.com/in/bj%C3%B6rg-gunnarsd%C3%B3ttir-456a76ab/";

class LeftCol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: sunglow),
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 1,
      child: MyProjects(),
      // child: Column(children: [
      //       Text('Björg Gunnarsdóttir  LinkedIn'),
      //   //     RichText(
      //   //   text: TextSpan(
      //   //     children: [
      //   //       TextSpan(
      //   //         text: "Björg Gunnarsdóttir  "
      //   //       ),
      //   //       TextSpan(
      //   //          text: "LinkedIn",
      //   //           recognizer: new TapGestureRecognizer()
      //   //             ..onTap = () { launch(url);
      //   //             }),
      //   //     ],
      //   // )),
      //   MyProjects(),       
      //     ],
      //     ),
      
    );
  }
}
