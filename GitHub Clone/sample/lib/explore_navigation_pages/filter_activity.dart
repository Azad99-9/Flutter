import 'package:flutter/material.dart';
import 'package:sample/classes/components.dart';
import 'package:sample/classes/designSystem.dart';
import 'package:sample/pages/explore.dart';

class FilterActivity extends StatefulWidget {
  const FilterActivity({super.key});

  @override
  State<FilterActivity> createState() => _FilterActivityState();
}

class _FilterActivityState extends State<FilterActivity> {
  bool announcementsisChecked = false;
  bool releasesisChecked = false;
  bool starsisChecked = false;
  bool repositoriesisChecked = false;
  bool followsisChecked = false;
  bool recommendationsisChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        backgroundColor: compColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Filter Activity',
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'SAVE',
                style: TextStyle(color: iconColor),
              ))
        ],
      ),
      body: Column(
        children: [
          CheckTile(
              imagePath: 'assets/images/announcements.png',
              checkName: 'Announcements'),
          CheckTile(
              imagePath: 'assets/images/releases.png', checkName: 'Releases'),
          CheckTile(imagePath: 'assets/images/starred.png', checkName: 'Stars'),
          CheckTile(
              imagePath: 'assets/images/repositories.png',
              checkName: 'Repositories'),
          CheckTile(
              imagePath: 'assets/images/follows.png', checkName: 'Follows'),
          CheckTile(
              imagePath: 'assets/images/recommendations.png',
              checkName: 'Recommendations'),
        ],
      ),
    );
  }
}

class CheckTile extends StatefulWidget {
  late String imagePath;
  late String checkName;
  CheckTile({super.key, required String imagePath, required String checkName}) {
    this.imagePath = imagePath;
    this.checkName = checkName;
  }

  @override
  State<CheckTile> createState() => _CheckTileState();
}

class _CheckTileState extends State<CheckTile> {
  bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          checkValue = !checkValue;
        });
      },
      child: Container(
        height: 56,
        color: compColor,
        child: Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Checkbox(
                side: BorderSide(color: lineColor),
                value: checkValue,
                onChanged: (bool? newValue) {
                  setState(() {
                    checkValue = newValue!;
                  });
                }),
            SizedBox(
              width: 18,
            ),
            Container(
              height: 30,
              width: 30,
              child: Image(
                image: AssetImage(widget.imagePath),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              child: Text(
                widget.checkName,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
