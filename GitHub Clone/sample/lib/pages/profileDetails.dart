import 'package:flutter/material.dart';
import 'package:sample/classes/designSystem.dart';

class profileDetails extends StatefulWidget {
  const profileDetails({super.key});

  @override
  State<profileDetails> createState() => _profileDetailsState();
}

class _profileDetailsState extends State<profileDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      height: 142,
      padding: EdgeInsets.only(left: 29, right: 29, top: 31, bottom: 31),
      color: compColor,
      child: Row(
        children: <Widget>[
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shaik Azad',
                style: TextStyle(
                  color: headlineColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Azad99-9',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
