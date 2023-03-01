import 'package:flutter/material.dart';
import 'package:sample/classes/designSystem.dart';
import 'package:sample/classes/components.dart';
import 'package:sample/explore_navigation_pages/filter_activity.dart';
import 'package:sample/pages/commonPages/warning.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        title: Text(
          'Explore',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        toolbarHeight: 52,
        backgroundColor: compColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: backColor,
          child: Column(
            children: [
              appBarBottom(context),
              buildSection(
                  path: 'assets/images/trending.png',
                  titlee: 'Trending Repositories',
                  context: context,
                  destination: Warning()),
              buildSection(
                  path: 'assets/images/smile.png',
                  titlee: 'Awesome Lists',
                  context: context,
                  destination: Warning()),
              activity(context),
              mainCard(context),
              SizedBox(
                height: 10,
              ),
              imageCard(
                context: context,
                imagePath: 'assets/images/marsh.png',
                profileImage: 'assets/images/profile.jpg',
                profileName: 'shaikazad',
                profileAdjective: 'awesome',
                description:
                    'Awesome lists about all kinds of interesting topics',
                tag1: '199.9k',
                tag1Icon: Icons.star_border,
                tag2: '1000 contributors',
                tag2Icon: Icons.account_circle,
                cardText: 'STAR',
                cardTextIcon: Icons.star_border,
                circleColor: iconColor,
                circleTag: 'Topics',
              ),
              SizedBox(
                height: 10,
              ),
              imagelessCard(
                  profileImage: 'assets/images/profile.jpg',
                  profileName: 'shaikazad',
                  profileAdjective: 'awesome',
                  description:
                      'A list of Free Software network services and web applications which can be hosted on your own servers',
                  tag1: '199.9k',
                  tag1Icon: Icons.star_border,
                  tag2: '1090 contributors',
                  tag2Icon: Icons.account_circle,
                  cardText: 'STAR',
                  cardTextIcon: Icons.star_border,
                  optionalTagIcon: Icons.circle,
                  optionalTagIconColor: Colors.blue,
                  optionalTagText: 'Makefile',
                  context: context,
                  circleColor: Colors.green,
                  circleTag: 'MakeFile'),
              SizedBox(
                height: 10,
              ),
              imagelessCard(
                profileImage: 'assets/images/profile.jpg',
                profileName: 'shaikazad',
                profileAdjective: 'awesome',
                description:
                    'A curated list of awesome Go frameworks, libraries and softwares',
                tag1: '199.9k',
                tag1Icon: Icons.star_border,
                tag2: '200 contributors',
                tag2Icon: Icons.account_circle,
                cardText: 'STAR',
                cardTextIcon: Icons.star_border,
                optionalTagIcon: Icons.circle,
                optionalTagIconColor: Color.fromRGBO(33, 150, 243, 1),
                optionalTagText: 'Go',
                context: context,
                circleTag: 'Go',
                circleColor: iconColor,
              ),
              SizedBox(
                height: 10,
              ),
              imagelessCard(
                profileImage: 'assets/images/profile.jpg',
                profileName: 'shaikazad',
                profileAdjective: 'awesome',
                description:
                    'A curated list of awesome Python frameworks, libraries, softwares and resources',
                tag1: '500.9k',
                tag1Icon: Icons.star_border,
                tag2: '17000 contributors',
                tag2Icon: Icons.account_circle,
                cardText: 'STAR',
                cardTextIcon: Icons.star_border,
                optionalTagIcon: Icons.circle,
                optionalTagIconColor: Colors.blue,
                optionalTagText: 'Python',
                context: context,
                circleTag: 'Python',
                circleColor: iconColor,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container imagelessCard(
      {required String profileImage,
      required String profileName,
      required String profileAdjective,
      required String description,
      required String tag1,
      required String tag2,
      required IconData tag1Icon,
      required IconData tag2Icon,
      required String cardText,
      required IconData cardTextIcon,
      required String optionalTagText,
      required IconData optionalTagIcon,
      required Color optionalTagIconColor,
      required BuildContext context,
      required Color circleColor,
      required String circleTag}) {
    return Container(
      decoration: BoxDecoration(
        color: compColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 4, bottom: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileTag(
                    imagePath: profileImage,
                    profileName: profileName,
                    profileAdjective: profileAdjective),
                SizedBox(
                  height: 6,
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: headsub,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    iconTag(tag1Icon, tag1, headlineColor),
                    SizedBox(
                      width: 10,
                    ),
                    iconTag(Icons.circle, circleTag, circleColor, 14),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                iconTag(tag2Icon, tag2, headlineColor),
                SizedBox(
                  height: 6,
                ),
                CardButton(
                  title: 'STAR',
                  leadingIcon: Icon(
                    cardTextIcon,
                    size: 20,
                    color: headlineColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container imageCard(
      {required BuildContext context,
      required String imagePath,
      required String profileImage,
      required String profileName,
      required String profileAdjective,
      required String description,
      required IconData tag1Icon,
      required String tag1,
      required IconData tag2Icon,
      required String tag2,
      required String cardText,
      required IconData cardTextIcon,
      Color? circleColor,
      String? circleTag}) {
    return Container(
      decoration: BoxDecoration(
        color: compColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                fit: BoxFit.cover,
                height: 197,
                width: MediaQuery.of(context).size.width,
                image: AssetImage(imagePath),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 4, bottom: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileTag(
                    imagePath: profileImage,
                    profileName: profileName,
                    profileAdjective: profileAdjective),
                SizedBox(
                  height: 6,
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: headsub,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                iconTag(tag1Icon, tag1, headlineColor),
                SizedBox(
                  height: 6,
                ),
                iconTag(tag2Icon, tag2, headlineColor),
                SizedBox(
                  height: 6,
                ),
                CardButton(
                  title: 'STAR',
                  leadingIcon: Icon(
                    cardTextIcon,
                    size: 20,
                    color: headlineColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row profileTag(
      {required String imagePath,
      required String profileName,
      required String profileAdjective}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 9,
          backgroundImage: AssetImage(
            imagePath,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          profileName,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: headlineColor,
          ),
        ),
        Text(
          ' / ',
          style: TextStyle(
            color: headsub,
          ),
        ),
        Text(
          profileAdjective,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: headlineColor,
          ),
        ),
      ],
    );
  }

  Row iconTag(IconData iconName, String tag, Color color, [double? size]) {
    return Row(
      children: [
        Icon(
          iconName,
          size: size ?? 18,
          color: color,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          tag,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: headsub,
          ),
        ),
      ],
    );
  }

  Container mainCard(BuildContext context) {
    return Container(
      height: 187,
      decoration: BoxDecoration(
        color: compColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      alignment: Alignment.center,
      child: Card(
        color: compColor,
        child: Column(
          children: [
            Icon(
              Icons.work,
              size: 40,
              color: iconColor,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Start Exploring GitHub for a Personalized Activity Feed',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: headlineColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Star repositories you like and follow contributions to receive personalized suggestions',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xffCACACA),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container activity(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 0, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Activity',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: headlineColor,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterActivity()),
              );
            },
            icon: Icon(
              Icons.filter_list_sharp,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Container appBarBottom(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      height: 29,
      width: MediaQuery.of(context).size.width,
      color: compColor,
      child: Text(
        'Discover',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: headlineColor,
        ),
      ),
    );
  }
}

class CardButton extends StatefulWidget {
  String title = '';
  late Icon leadingIcon;

  CardButton({super.key, required String title, required Icon leadingIcon}) {
    this.title = title;
    this.leadingIcon = leadingIcon;
  }

  @override
  State<CardButton> createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  bool starred = false;

  void _toggleStar() {
    setState(() {
      starred = !starred;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !starred
        ? Container(
            child: ElevatedButton(
              style:
                  ButtonStyle(side: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled))
                  return BorderSide(width: 1, color: lineColor);
                else
                  return BorderSide(width: 1, color: lineColor);
              }), backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled))
                  return cardButtonColor;
                else
                  return cardButtonColor;
              })),
              onPressed: () {
                _toggleStar();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.leadingIcon,
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: headlineColor,
                    ),
                  ),
                ],
              ),
            ),
          )
        : Row(
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      side: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.disabled))
                      return BorderSide(width: 1, color: lineColor);
                    else
                      return BorderSide(width: 1, color: lineColor);
                  }), backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.disabled))
                      return cardButtonColor;
                    else
                      return cardButtonColor;
                  })),
                  onPressed: () {
                    _toggleStar();
                  },
                  child: Icon(
                    Icons.star,
                    color: gold,
                  )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          side: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.disabled))
                          return BorderSide(width: 1, color: lineColor);
                        else
                          return BorderSide(width: 1, color: lineColor);
                      }), backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.disabled))
                          return cardButtonColor;
                        else
                          return cardButtonColor;
                      })),
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: true,
                          backgroundColor: backColor,
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return Container(
                                  color: compColor,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.linear_scale,
                                        color: lineColor,
                                      ),
                                      TextButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(
                                                Icons.add,
                                                color: iconColor,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('Create list',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: iconColor)),
                                            ],
                                          )),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: lineColor,
                          ),
                          Text(
                            'Add to list',
                            style: TextStyle(color: headlineColor),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          );
  }
}
