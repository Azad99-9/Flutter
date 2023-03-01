import 'package:flutter/material.dart';
import 'package:sample/classes/designSystem.dart';

List<SelectOption> selecttiles = [
  const SelectOption(
      image: 'assets/images/vr.png', txt1: 'Gaming', txt2: 'Virtual Reality'),
  const SelectOption(
      image: 'assets/images/bitcoin.png', txt1: 'Bitcoin', txt2: 'Block Chain'),
  const SelectOption(
      image: 'assets/images/programming.png',
      txt1: 'Software - Development',
      txt2: 'Computer Programming'),
  const SelectOption(
      image: 'assets/images/stockmarket.png',
      txt1: 'Stock Market',
      txt2: 'Trading'),
];

List<SelectedOption> selectedtiles = [
  const SelectedOption(
      image: 'assets/images/vr.png', txt1: 'Gaming', txt2: 'Virtual Reality'),
  const SelectedOption(
      image: 'assets/images/bitcoin.png', txt1: 'Bitcoin', txt2: 'Block Chain'),
  const SelectedOption(
      image: 'assets/images/programming.png',
      txt1: 'Software - Development',
      txt2: 'Computer Programming'),
  const SelectedOption(
      image: 'assets/images/stockmarket.png',
      txt1: 'Stock Market',
      txt2: 'Trading'),
];

List<SelectOption> selectOptions = [
  selecttiles[0],
  selecttiles[1],
  selecttiles[2],
  selecttiles[3],
];

List<SelectedOption> selectedOptions = [];

Map<SelectOption, SelectedOption> selectCorrespond = {
  selecttiles[0]: selectedtiles[0],
  selecttiles[1]: selectedtiles[1],
  selecttiles[2]: selectedtiles[2],
  selecttiles[3]: selectedtiles[3],
};

Map<SelectedOption, SelectOption> selectedCorrespond = {
  selectedtiles[0]: selecttiles[0],
  selectedtiles[1]: selecttiles[1],
  selectedtiles[2]: selecttiles[2],
  selectedtiles[3]: selecttiles[3],
};

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
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
          'Favorites',
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            color: compColor,
            child: TextField(
              style: TextStyle(color: headlineColor),
              decoration: InputDecoration(
                fillColor: compColor,
                focusColor: lineColor,
                prefixIcon: Icon(
                  Icons.search,
                  color: lineColor,
                ),
                hintText: 'Search Repositories',
                hintStyle: TextStyle(color: lineColor),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: compColor,
            padding: EdgeInsets.all(19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selected',
                  style: TextStyle(color: lineColor, fontSize: 16),
                ),
                Column(
                  children: selectedOptions.map((item) {
                    return InkWell(
                      child: item,
                      onTap: () {
                        setState(() {
                          selectedOptions.remove(item);
                          selectOptions.insert(0, selectedCorrespond[item]!);
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: compColor,
            padding: EdgeInsets.all(19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Repositories',
                  style: TextStyle(color: lineColor, fontSize: 16),
                ),
                Column(
                  children: selectOptions.map((item) {
                    return InkWell(
                      child: item,
                      onTap: () {
                        setState(() {
                          selectOptions.remove(item);
                          selectedOptions.insert(0, selectCorrespond[item]!);
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class SelectedOption extends StatelessWidget {
  final String image;
  final String txt1;
  final String txt2;

  const SelectedOption(
      {super.key, required this.image, required this.txt1, required this.txt2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          height: 56,
          color: compColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.close,
                color: lineColor,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(image),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    txt1,
                    style: TextStyle(fontSize: 16, color: lineColor),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    txt2,
                    style: TextStyle(fontSize: 18, color: headlineColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SelectOption extends StatelessWidget {
  final String image;
  final String txt1;
  final String txt2;

  const SelectOption(
      {super.key, required this.image, required this.txt1, required this.txt2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          height: 56,
          color: compColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(image),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        txt1,
                        style: TextStyle(fontSize: 16, color: lineColor),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        txt2,
                        style: TextStyle(fontSize: 18, color: headlineColor),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.add,
                color: iconColor,
                size: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
