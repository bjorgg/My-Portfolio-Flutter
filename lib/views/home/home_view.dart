import 'package:flutter/material.dart';
import 'package:myportfolio/constants/app_colors.dart';
import 'package:myportfolio/widgets/left_col/left_col.dart';
import 'package:myportfolio/widgets/right_col/right_col.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: <Widget>[
            LeftCol(),  
            RightCol(),        
          ])
        
     

    );
  }
}