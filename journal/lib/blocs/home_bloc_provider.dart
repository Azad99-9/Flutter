import 'package:flutter/material.dart';
import 'package:journal/blocs/home_bloc.dart';

class HomeBlocProvider extends InheritedWidget {
  final HomeBloc? homeBloc;
  String? uid;

  HomeBlocProvider(
      {Key? key, required Widget child, required this.homeBloc, this.uid})
      : super(key: key, child: child);

  static HomeBlocProvider? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<HomeBlocProvider>());
  }

  @override
  bool updateShouldNotify(HomeBlocProvider oldWidget) =>
      homeBloc != oldWidget.homeBloc;
}
