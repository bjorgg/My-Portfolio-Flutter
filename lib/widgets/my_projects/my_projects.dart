import 'package:flutter/material.dart';
import 'package:myportfolio/constants/adaptiveSize.dart';
import 'package:myportfolio/constants/app_colors.dart';
import 'package:myportfolio/widgets/right_col/right_col.dart';

class Project {
  int id;
  String module;
  String title;
  String type;
  String tech;
  String description;
  String logo;
  String image;
  String github;
  String livesite;

  Project(this.id, this.module, this.title, this.type, this.tech,
      this.description, this.logo, this.image, this.github, this.livesite);

  @override
  String toString() {
    return '{ ${this.id}, ${this.module}, ${this.title}, ${this.type}, ${this.tech}, ${this.description}, ${this.logo}, ${this.image}, ${this.github}, ${this.livesite} }';
  }

  String titleDescription() {
    return '${this.title} - ${this.description}';
  }
}

class MyProjects extends StatelessWidget {
  final List myProjects = [];
  final Function handleProjectOnTap;

  MyProjects({
    this.handleProjectOnTap,
  });

  Widget _buildList() {
    myProjects.add(Project(
        1,
        '1',
        'Stofan - fictional web design studio',
        'Collabrative',
        'HTML, CSS',
        'This is my first group project were we created a website for a fictional web design studio. \n\nThis project was about “testing the water”. Creating a UI, coding it, deploying it and presenting the work to industry professionals. \n\nThe group used Agile techniques to organize the work, created the UI in Figma, coded with HTML and CSS and deployed on GitHub.',
        'Stofan_logo.svg',
        'Stofan_img.png',
        'https://github.com/Huldas96/Stofan',
        'https://huldas96.github.io/Stofan'));
    myProjects.add(Project(
        2,
        '2',
        'Heilsan mín - health app',
        'Collabrative',
        'HTML, SCSS, JavaScript',
        'This is an Icelandic health tracker calendar app. It is a single page Interactive and Responsive Web Application. \n\nThe user can create their own conditions or appointments that will be logged into a calendar. All logged information is stored in local storage so that the user can keep track of his/her own health.',
        'health_app_logo.svg',
        'health_app_img.png',
        'https://github.com/johannTor/health-app',
        'http://heilsanmin.surge.sh'));
    myProjects.add(Project(
        3,
        '3',
        'Öl, Icelandic beers and breweries',
        'Collabrative',
        'React, React Leaflet ...',
        'In this project we worked with API\'s, React, Packages, modules and bundlers, UX and much more. \n\nOur web-application is all about Icelandic beers and breweries. The frontpage renders a map with your location(optional) and it shows you the nearest breweries to you. You can flip and sort through a lists of all beers or breweries. Each brewery has its own information page containing a list with all of their beers. In the beer list you can toggle heart or checkbox for each beer to keep track of what you have loved and what you have tried.',
        'ol_logo.svg',
        'ol_img.png',
        'https://github.com/alexanderjarl91/bruggid',
        'https://oliceland.netlify.app'));
    myProjects.add(Project(
        4,
        '3',
        'Plant collection',
        'Individual',
        'HTML, CSS, JavaScript',
        'This is a school project working with History API and local storage. I created a single page application (SPA) plant collection. There are three pages; front page, plant collection and favorites. On each plant you can click on a more info button to show more info and click again to hide it. Each plant has also a add to favorites button and when you click it the plant shows on favorites page and the button changes color and displays remove from favorites. You can click on the remove button on either page to remove the plant from the favorite page. The plant array is set to local storage so the plants stay as favorites when you refresh.',
        'plant_collection.svg',
        'plant_coll_img.png',
        'https://github.com/bjorgg/JavaScript-Web-APIs',
        'https://bjorgg.github.io/JavaScript-Web-APIs'));
    myProjects.add(Project(
        5,
        '4',
        'Memory game',
        'Individual',
        'React, CSS',
        'This is a school project in using React. I created a simple memory card game. For this assignment I decided not to have any extra features as score, high score or difficulties. But it\'s possible to add later. You can play the game and start a new game, that\'s it. Everybody should now how to play memory so i won\'t explain it here. You can find comments in the JavaScript files.',
        'memory_game.svg',
        'mem_game_img.png',
        'https://github.com/bjorgg/React-Memory-game',
        'https://bjorgg.github.io/React-Memory-game'));

    return ListView.builder(
      itemCount: myProjects.length,
      itemBuilder: (context, index) {
        return _buildGroupRow(myProjects[index], context);
      },
    );
  }

  Widget _buildGroupRow(Project myProject, BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: merlin, width: .5),
        ),
      ),
      child: InkWell(
        onTap: () {
          handleProjectOnTap(myProject);
        },
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  myProject.module,
                  style: TextStyle(
                    fontSize: AdaptiveSize().getadaptiveSize(context, 18),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  myProject.title,
                  style: TextStyle(
                    fontSize: AdaptiveSize().getadaptiveSize(context, 18),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  myProject.type,
                  style: TextStyle(
                    fontSize: AdaptiveSize().getadaptiveSize(context, 18),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  myProject.tech,
                  style: TextStyle(
                    fontSize: AdaptiveSize().getadaptiveSize(context, 18),
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: merlin, width: .5),
          ),
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  'MODULE',
                  style: TextStyle(
                    fontSize: AdaptiveSize().getadaptiveSize(context, 14),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  'PROJECT',
                  style: TextStyle(
                    fontSize: AdaptiveSize().getadaptiveSize(context, 14),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'TYPE',
                  style: TextStyle(
                    fontSize: AdaptiveSize().getadaptiveSize(context, 14),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'TECHNOLOGY',
                  style: TextStyle(
                    fontSize: AdaptiveSize().getadaptiveSize(context, 14),
                  ),
                ),
              ),
            ]),
      ),
      Expanded(
        child: _buildList(),
      ),
    ]);
  }
}
