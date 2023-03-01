import 'package:flutter/material.dart';
import 'package:sample/classes/designSystem.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        backgroundColor: compColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: lineColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('About'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildQnA('What is GUI clone ?',
                  '\t\t\t A GUI (Graphical User Interface) clone refers to a software application that has been designed to closely resemble another application\'s user interface. In other words, it is a replica of a graphical user interface of an existing program, designed to look and feel like the original program. \n \t\t\t The purpose of creating this GUI clone is, I can demonstrate my ability to understand and replicate complex design patterns, as well as my proficiency in Flutter and Dart. As it is being said that this app is a GUI clone of GIT hub mobile it is capable of all frontend functionalities of the original app but not essentially the back-end functionalities.'),
              buildQnA('Why I\'ve developed this app ?',
                  ' \t\t\t Developing an app to act as proof of work is a common practice for self-taught developers who have not taken certified courses. It is a way for developers to demonstrate our skills and expertise to the community.\n \t\t\t In this context, developing an app can serve as proof of my work and demonstrate my skills and experience. By creating a functional and well-designed app, so that I can show that I have the ability to learn new skills, problem-solve, and deliver high-quality products.'),
              buildQnA('From where did I learn ?',
                  ' \t\t\t I firmly believe that learning anything new requires two key elements - courage and consistency. \n \t\t\t Fortunately, in today\'s world, almost all the skills and knowledge required for learning something new are available for free on the internet.\n \t\t\t Personally, I have developed this app by relying on various textbooks and the official documentation provided by Flutter. These resources have provided me with a comprehensive understanding of the subject matter, allowing me to master the necessary skills and knowledge to create my app.'),
              buildQnA('About the developer',
                  ' \t\t\t Hi I am Azad - a passionate computer science undergraduate with a huge interest for software development and computer programming. I am a fast learner who is constantly curious about new skills and technologies in the field. My passion for building software solutions has led me to explore various programming languages and tools to create efficient and effective solutions. \n \t\t\t Overall, my commitment to learning, passion for software development, and drive to innovate makes me a valuable asset to any team or project in the field of computer science.'),
            ],
          ),
        ),
      ),
    );
  }
}

Column buildQnA(String heading, String description) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 20,
      ),
      Text(
        heading,
        style: TextStyle(
          color: headlineColor,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        description,
        style: TextStyle(
          color: headlineColor,
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
