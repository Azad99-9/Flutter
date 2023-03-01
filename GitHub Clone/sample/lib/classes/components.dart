import 'package:flutter/material.dart';
import 'package:sample/classes/designSystem.dart';

ElevatedButton buildDefaultButton(
    void Function() action, String text, Color buttoncolor, Color textColor) {
  return ElevatedButton(
    onPressed: () {
      action();
    },
    child: Text(
      text,
      style: TextStyle(color: textColor),
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) return buttoncolor;
        return buttoncolor;
      }),
    ),
  );
}

Container buildSection(
    {required String path,
    required String titlee,
    required BuildContext context,
    required Widget destination}) {
  return Container(
    color: compColor,
    child: ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
      leading: Container(
        height: 30,
        width: 30,
        child: Image(
          image: AssetImage(
            path,
          ),
        ),
      ),
      title: Text(
        titlee,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    ),
  );
}

Container buildCategories({
  required String path,
  required String titlee,
  required BuildContext context,
  required int trailing,
  required Widget destination,
}) {
  return Container(
    color: compColor,
    child: ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
      trailing: Text(
        trailing.toString(),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      leading: Container(
        height: 30,
        width: 30,
        child: Image(
          image: AssetImage(
            path,
          ),
        ),
      ),
      title: Text(
        titlee,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    ),
  );
}

AppBar defaultAppBar({required String title}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    ),
    toolbarHeight: 52,
    backgroundColor: compColor,
  );
}
