import 'package:flutter/material.dart';
import 'package:sample/classes/components.dart';
import 'package:sample/classes/designSystem.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool readMore = false;

  void _toggleReadMore() {
    setState(() {
      readMore = !readMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !readMore
        ? Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopContainer(),
                  Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 0),
                    height: 180,
                    child: Text(
                      '''-> Welcome to my GitHub Mobile App clone, developed Using Flutter! \n\n-> As a self-taught Flutter developer, I wanted to showcase my skills with this basic clone app. \n\n-> This is my first project using Flutter, but I plan on developing more in future. \n\n-> With this clone, you can explore the basic functionality of the GitHub Mobile App UI. \n\n-> Use the navigation bar at the bottom to switch between the different sections of the app. \n\n-> This app was developed using the knowledge I gained from a Flutter textbook, combined with my own creativity and problem-solving skills \n\n-> Thanks for checking out my app and feel free to reach out to me with any feedback or questions!''',
                      style: TextStyle(
                        color: headlineSmallColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, compColor.withOpacity(1)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              buildDefaultButton(
                  _toggleReadMore, 'ReadMore', iconColor, Colors.white),
            ],
          )
        : Container(
            color: compColor,
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
              minHeight: 0,
              maxHeight: double.infinity,
            ),
            child: Column(
              children: [
                TopContainer(),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  constraints: BoxConstraints(
                    minHeight: 0,
                    maxHeight: double.infinity,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    '-> Welcome to my GitHub Mobile App clone, developed Using Flutter! \n\n-> As a self-taught Flutter developer, I wanted to showcase my skills with this basic clone app. \n\n-> This is my first project using Flutter, but I plan on developing more in future. \n\n-> With this clone, you can explore the basic functionality of the GitHub Mobile App UI. \n\n-> Use the navigation bar at the bottom to switch between the different sections of the app. \n\n-> This app was developed using the knowledge I gained from a Flutter textbook, combined with my own creativity and problem-solving skills \n\n-> Thanks for checking out my app and feel free to reach out to me with any feedback or questions!',
                    style: TextStyle(
                      color: headlineSmallColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                buildDefaultButton(
                    _toggleReadMore, 'ShowLess', compColor, iconColor),
              ],
            ),
          );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: lineColor, width: 1)),
      ),
      width: MediaQuery.of(context).size.width,
      height: 33,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 11,
          ),
          Text(
            'Azad99-9',
            style: TextStyle(
              color: headlineSmallColor,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          Text(
            '/README',
            style: TextStyle(
              color: headlineSmallColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            '.md',
            style: TextStyle(
              color: headlineSmallColor,
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
