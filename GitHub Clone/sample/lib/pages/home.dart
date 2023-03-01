import 'package:flutter/material.dart';
import 'package:sample/classes/designSystem.dart';
import 'package:sample/classes/components.dart';
import 'package:sample/explore_navigation_pages/filter_activity.dart';
import 'package:sample/pages/commonPages/search.dart';
import 'package:sample/pages/commonPages/warning.dart';
import 'package:sample/pages/home_navigation_pages/discussions.dart';
import 'package:sample/pages/home_navigation_pages/favorites.dart';
import 'package:sample/pages/home_navigation_pages/issues.dart';
import 'package:sample/pages/home_navigation_pages/organisations.dart';
import 'package:sample/pages/home_navigation_pages/pullrequests.dart';
import 'package:sample/pages/home_navigation_pages/repositories.dart';
import 'package:sample/pages/home_navigation_pages/starred.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        toolbarHeight: 52,
        backgroundColor: compColor,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ));
            },
            icon: Icon(
              Icons.search,
              size: 32,
              color: iconColor,
            ),
          ),
          SizedBox(width: 20),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Warning(),
                  ));
            },
            icon: Icon(
              Icons.add_circle_outline,
              size: 32,
              color: iconColor,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(38),
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Work',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: headlineColor,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FilterActivity(),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection(
                path: 'assets/images/issues.png',
                titlee: 'Issues',
                context: context,
                destination: Issues()),
            buildSection(
                path: 'assets/images/pullreqs.png',
                titlee: 'Pull Requests',
                context: context,
                destination: PullRequests()),
            buildSection(
                path: 'assets/images/disc.png',
                titlee: 'Discussions',
                context: context,
                destination: Discussions()),
            buildSection(
                path: 'assets/images/repositories.png',
                titlee: 'Repositories',
                context: context,
                destination: Repositories()),
            buildSection(
                path: 'assets/images/organisations.png',
                titlee: 'Organisations',
                context: context,
                destination: Organisations()),
            buildSection(
                path: 'assets/images/starred.png',
                titlee: 'Starred',
                context: context,
                destination: Starred()),
            Container(
              color: compColor,
              child: Divider(
                thickness: 1,
                color: lineColor,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 5, top: 5),
              width: MediaQuery.of(context).size.width,
              color: compColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Favorites',
                    style: TextStyle(
                      color: headlineColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'Add favorite repositories for quick access at any time, without having to search',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffCACACA),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Favorites()));
                        },
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
                        child: Text(
                          'ADD FAVORITES',
                          style: TextStyle(color: iconColor),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
