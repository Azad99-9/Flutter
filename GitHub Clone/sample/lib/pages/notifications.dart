import 'package:flutter/material.dart';
import 'package:sample/classes/components.dart';
import 'package:sample/classes/designSystem.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool isUnread = true;

  void _toggleUnread() {
    setState(() {
      isUnread = !isUnread;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        toolbarHeight: 52,
        backgroundColor: compColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(47),
          child: Container(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
                child: isUnread ? beforeUnread() : afterUnread(),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 10, top: 40, bottom: 0),
              child: Center(
                child: Container(
                  height: 500,
                  width: 500,
                  child: Image(image: AssetImage('assets/images/marsh.png')),
                ),
              ),
            ),
            isUnread ? beforeUnreadMainText() : afterUnreadMainText(),
          ],
        ),
      ),
    );
    ;
  }

  Column beforeUnreadMainText() {
    return Column(
      children: [
        Text(
          'All caught up!',
          style: TextStyle(
            color: headlineColor,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
          child: Text(
            'Take a break, write some code, and do what you do best.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xffCACACA),
            ),
          ),
        ),
      ],
    );
  }

  Column afterUnreadMainText() {
    return Column(
      children: [
        Text(
          'No notifications',
          style: TextStyle(
            color: headlineColor,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
          child: Text(
            'Use fewer filters or reset all filters',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xffCACACA),
            ),
          ),
        ),
        buildDefaultButton(
            _toggleUnread, 'RESET ALL FILTERS', compColor, iconColor),
      ],
    );
  }

  Row beforeUnread() {
    return Row(
      children: [
        // buildStadiumCards('Issues', Icons.arrow_drop_down_outlined),
        dropDown(),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            _toggleUnread();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: lineColor, width: 1),
              color: Color(0xff333333),
            ),
            padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
            child: Card(
              color: Color(0xff333333),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Unread',
                    style: TextStyle(
                      color: headlineColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        BottomDrawer(),
      ],
    );
  }

  Row afterUnread() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _toggleUnread();
            });
          },
          child: buildStadiumCards('1', Icons.filter_list_sharp),
        ),
        SizedBox(
          width: 10,
        ),
        dropDown(),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            _toggleUnread();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(width: 1),
              color: iconColor,
            ),
            padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
            child: Card(
              color: iconColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Unread',
                    style: TextStyle(
                      color: headlineColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        BottomDrawer(),
      ],
    );
  }
}

Container buildStadiumCards(String title, IconData iconName) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      border: Border.all(color: lineColor, width: 1),
      color: Color(0xff333333),
    ),
    padding: EdgeInsets.only(left: 10, right: 4, top: 0, bottom: 0),
    child: Card(
      color: Color(0xff333333),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: headlineColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            iconName,
            color: headlineColor,
          ),
        ],
      ),
    ),
  );
}

class dropDown extends StatefulWidget {
  const dropDown({super.key});

  @override
  State<dropDown> createState() => _dropDownState();
}

class _dropDownState extends State<dropDown> {
  List<String> options = ['Inbox', 'Saved', 'Done'];
  String selectedOption = "Inbox";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: lineColor, width: 1),
        color: Color(0xff333333),
      ),
      padding: EdgeInsets.only(left: 12, right: 5, top: 0, bottom: 0),
      height: 34,
      child: DropdownButton(
        dropdownColor: compColor,
        icon: Icon(
          Icons.arrow_drop_down_outlined,
          color: headlineColor,
        ),
        underline: Container(),
        style: TextStyle(
          color: headlineColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        value: selectedOption,
        items: options.map((option) {
          return DropdownMenuItem(
            child: Text(option),
            value: option,
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedOption = newValue!;
          });
        },
      ),
    );
  }
}

class BottomDrawer extends StatefulWidget {
  const BottomDrawer({super.key});

  @override
  State<BottomDrawer> createState() => _BottomDrawerState();
}

class _BottomDrawerState extends State<BottomDrawer> {
  late double bottomDrawerHeight;
  bool beforeSearch = true;

  @override
  void dispose() {
    print('hi');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return beforeSearchClick(context);
  }

  InkWell beforeSearchClick(BuildContext context) {
    return InkWell(
      onTap: () {
        bottomDrawerHeight = MediaQuery.of(context).size.height / 1.5;
        showModalBottomSheet(
          isScrollControlled: true,
          isDismissible: true,
          backgroundColor: backColor,
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  height: bottomDrawerHeight,
                  decoration: BoxDecoration(
                    color: backColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: compColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Icon(
                          Icons.linear_scale,
                          color: lineColor,
                        ),
                      ),
                      AppBar(
                        leading: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              beforeSearch = true;
                            });
                          },
                        ),
                        title: Text('Filter by repository'),
                        actions: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                bottomDrawerHeight =
                                    MediaQuery.of(context).size.height;
                                beforeSearch = false;
                              });
                            },
                            icon: Icon(
                              Icons.search,
                              color: iconColor,
                            ),
                          ),
                        ],
                        backgroundColor: compColor,
                      ),
                      beforeSearch
                          ? Container(
                              padding: EdgeInsets.all(30),
                              child: Text(
                                'Nothing to see here',
                                style: TextStyle(
                                  color: headlineColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : Container(
                              height: 50,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                style: TextStyle(color: headlineColor),
                                decoration: InputDecoration(
                                  focusColor: lineColor,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: lineColor,
                                  ),
                                  hintText: 'Search....',
                                  hintStyle: TextStyle(color: headlineColor),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                              ),
                            )
                    ],
                  ),
                );
              },
            );
          },
        );
      },
      child: buildStadiumCards('Repositories', Icons.arrow_drop_down_outlined),
    );
  }
}
