import 'package:flutter/material.dart';

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

  Project(this.id, this.module, this.title, this.type, this.tech, this.description, this.logo, this.image, this.github, this.livesite);

  @override
  String toString() {
    return '{ ${this.id}, ${this.module}, ${this.title}, ${this.type}, ${this.tech}, ${this.description}, ${this.logo}, ${this.image}, ${this.github}, ${this.livesite} }';
  }

}

void projectBuilder() {
    List projects = [];
    projects.add(Project(1, '1', 'Stofan - made up web design studio', 'collabrative', 'HTML, CSS', 'This project bla bla bla', 'logo url', 'image', 'https://github.com/Huldas96/Stofan', 'https://huldas96.github.io/Stofan'));
    projects.add(Project(2, '2', 'Heilsan mín - health app', 'collabrative', 'HTML, SCSS, JavaScript', 'This is an Icelandic health tracker calendar app. It is a single page Interactive and Responsive Web Application. \nThe user can create their own conditions or appointments that will be logged into a calendar. All logged information is stored in local storage so that the user can keep track of his/her own health.', 'logo url', 'image', 'https://github.com/johannTor/health-app', 'http://heilsanmin.surge.sh'));
    projects.add(Project(3, '3', 'Öl, Icelandic beers and breweries', 'collabrative', 'React, React Leaflet ...', 'In this project we worked with API\'s, React, Packages, modules and bundlers, UX and much more. \nOur web-application is all about Icelandic beers and breweries. The frontpage renders a map with your location(optional) and it shows you the nearest breweries to you. You can flip and sort through a lists of all beers or breweries. Each brewery has its own information page containing a list with all of their beers. In the beer list you can toggle heart or checkbox for each beer to keep track of what you have loved and what you have tried.', 'logo url', 'image', 'https://github.com/alexanderjarl91/bruggid', 'https://oliceland.netlify.app'));
    projects.add(Project(4, '3', 'Plant collection', 'indivitual', 'HTML, CSS, JavaScript', 'This is a school project working with History API and local storage. I created a single page application (SPA) plant collection. There are three pages; front page, plant collection and favorites. On each plant you can click on a more info button to show more info and click again to hide it. Each plant has also a add to favorites button and when you click it the plant shows on favorites page and the button changes color and displays remove from favorites. You can click on the remove button on either page to remove the plant from the favorite page. The plant array is set to local storage so the plants stay as favorites when you refresh.', 'logo url', 'image', 'https://github.com/bjorgg/JavaScript-Web-APIs', 'https://bjorgg.github.io/JavaScript-Web-APIs'));
    projects.add(Project(5, '4', 'Memory game', 'indivitual', 'React, CSS', 'This is a school project in using React. I created a simple memory card game. For this assignment I decided not to have any extra features as score, high score or difficulties. But it\'s possible to add later. You can play the game and start a new game, that\'s it. Everybody should now how to play memory so i won\'t explain it here. You can find comments in the JavaScript files.', 'logo url', 'image', 'https://github.com/bjorgg/React-Memory-game', 'https://bjorgg.github.io/React-Memory-game'));

    print(projects);
  }

  class MyProjects extends StatefulWidget {
   
    @override
    _MyProjectsState createState() => _MyProjectsState();
  }
  


  class _MyProjectsState extends State<MyProjects> {
    final projects = ['Stofan', 'Heilsan mín', 'Öl, Icelandic beers and breweries'];

    Widget _buildList() {
    return 
    ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ListTile(
      title: Text('${projects[index]}'),
    );
      },
    );
  }
    
    @override
    Widget build(BuildContext context) {
      return Container(
        child: _buildList()
      );
    }
  }

  