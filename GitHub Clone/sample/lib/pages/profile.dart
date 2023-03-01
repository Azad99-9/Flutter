import 'package:flutter/material.dart';
import 'package:sample/classes/designSystem.dart';
import 'package:sample/pages/commonPages/about.dart';
import 'package:sample/pages/commonPages/settings.dart';
import 'package:sample/pages/commonPages/share.dart';
import 'package:sample/pages/description.dart';
import 'package:sample/pages/home_navigation_pages/organisations.dart';
import 'package:sample/pages/home_navigation_pages/repositories.dart';
import 'package:sample/pages/home_navigation_pages/starred.dart';
import 'package:sample/pages/profileDetails.dart';
import 'package:sample/classes/components.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 52,
        backgroundColor: compColor,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Share(),
                ),
              );
            },
            icon: Icon(
              Icons.share,
              size: 32,
              color: iconColor,
            ),
          ),
          SizedBox(width: 20),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
            icon: Icon(
              Icons.settings,
              size: 32,
              color: iconColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: compColor,
          child: Column(
            children: <Widget>[
              profileDetails(),
              Container(
                color: backColor,
                height: 10,
              ),
              Description(),
              Container(
                color: backColor,
                height: 10,
              ),
              Popular(),
            ],
          ),
        ),
      ),
    );
  }
}

class Popular extends StatelessWidget {
  const Popular({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 409,
      padding: EdgeInsets.only(top: 10),
      color: compColor,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 21,
              ),
              Icon(
                Icons.star_border_outlined,
                color: headlineSmallColor,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Popular',
                style: TextStyle(
                  color: headlineSmallColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          PopularCardDraw(),
          Divider(
            thickness: 1,
            color: lineColor,
          ),
          Container(
            child: Column(
              children: [
                buildCategories(
                  path: 'assets/images/repositories.png',
                  titlee: 'Repositories',
                  trailing: 0,
                  destination: Repositories(),
                  context: context,
                ),
                buildCategories(
                  path: 'assets/images/organisations.png',
                  titlee: 'Organisations',
                  trailing: 0,
                  destination: Organisations(),
                  context: context,
                ),
                buildCategories(
                  path: 'assets/images/starred.png',
                  titlee: 'starred',
                  trailing: 0,
                  destination: Starred(),
                  context: context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PopularCardDraw extends StatelessWidget {
  const PopularCardDraw({
    Key? key,
  }) : super(key: key);

  InkWell buildCard(String imagepath, String iconText, String headText,
      String bodyText, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => About()),
        );
      },
      child: Card(
        color: cardColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border(
              bottom: BorderSide(color: lineColor, width: 1),
              top: BorderSide(color: lineColor, width: 1),
              left: BorderSide(color: lineColor, width: 1),
              right: BorderSide(color: lineColor, width: 1),
            ),
          ),
          height: 148,
          width: 262,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(imagepath),
                    radius: 9,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    iconText,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: headlineColor,
                    ),
                  ),
                ],
              ),
              Text(
                headText,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: headlineColor,
                ),
              ),
              SizedBox(
                height: 62,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    bodyText,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: headlineColor,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: gold,
                    size: 18,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    '0',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: headlineColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            buildCard(
              'assets/images/profile.jpg',
              'Azad99-9',
              'Why I\'ve Built this App ?',
              'In a world where \"certifications\" are highly valued, I believe that this app serves as my own certification. It demonstrates my ability to create a functional and visually appealing mobile app using flutter.',
              context,
            ),
            SizedBox(
              width: 10,
            ),
            buildCard(
              'assets/images/profile.jpg',
              'Azad99-9',
              'From where did I learn ?',
              'I strongly believe that rather than costly courses we need only courage and consistency to learn anything. I\'m proud to say that I\'ve learned everything I needed to create this app from various textbooks and the Flutter documentation, all of which are free resources.',
              context,
            ),
            SizedBox(
              width: 10,
            ),
            buildCard(
              'assets/images/profile.jpg',
              'Azad99-9',
              'What\'s Special ?',
              'This app is designed to be cross-platform. which means that it can be run on a variety of operating systems including Android, IOS, Linux, Windows. Whether you\'re using a desktop or mobile device, you can access all the features of this app from anywhere, at any time.',
              context,
            ),
            SizedBox(
              width: 10,
            ),
            buildCard(
              'assets/images/profile.jpg',
              'Azad99-9',
              'What is a GUI Clone ?',
              'It\'s basically a software application that replicates the user interface of another application or system. It means that the GUI Clone will have a similar look and feel as the original application. In this context this clone is built to showcase my skills in attempt of building a Industry level mobile app UI.',
              context,
            ),
          ],
        ),
      ),
    );
  }
}
