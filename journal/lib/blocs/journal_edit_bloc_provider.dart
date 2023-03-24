import 'package:flutter/material.dart';
import 'package:journal/blocs/journal_edit_bloc.dart';
import 'package:journal/models/journal.dart';

class JournalEditBlocProvider extends InheritedWidget {
  JournalEditBloc? journalEditBloc;

  JournalEditBlocProvider(
      {Key? key,
      required Widget child,
      bool? add,
      Journal? journal,
      this.journalEditBloc})
      : super(key: key, child: child);

  static JournalEditBlocProvider? of(BuildContext context) {
    return (context
        .dependOnInheritedWidgetOfExactType<JournalEditBlocProvider>());
  }

  @override
  bool updateShouldNotify(JournalEditBlocProvider oldWidget) =>
      journalEditBloc != oldWidget.journalEditBloc;
}
