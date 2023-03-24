import 'package:flutter/material.dart';
import 'package:journal/blocs/journal_edit_bloc.dart';
import 'package:journal/blocs/journal_edit_bloc_provider.dart';
import 'package:journal/classes/FormatDates.dart';
import 'package:journal/classes/mood_icons.dart';

class EditEntry extends StatefulWidget {
  const EditEntry({super.key});

  @override
  State<EditEntry> createState() => _EditEntryState();
}

class _EditEntryState extends State<EditEntry> {
  JournalEditBloc? _journalEditBloc;
  FormatDates? _formatDates;
  MoodIcons? _moodIcons;
  TextEditingController? _noteController;

  @override
  void initState() {
    super.initState();
    _formatDates = FormatDates();
    _moodIcons = MoodIcons();
    _noteController = TextEditingController();
    _noteController?.text = '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _journalEditBloc = JournalEditBlocProvider.of(context)?.journalEditBloc;
  }

  @override
  dispose() {
    _noteController?.dispose();
    _journalEditBloc?.dispose();
    super.dispose();
  }

  Future<String> _selectDate(String selectedDate) async {
    DateTime _initialDate = DateTime.parse(selectedDate);
    final DateTime? _pickedDate = await showDatePicker(
        context: context,
        initialDate: _initialDate,
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (_pickedDate != null) {
      selectedDate = DateTime(
              _pickedDate.year,
              _pickedDate.month,
              _pickedDate.day,
              _initialDate.hour,
              _initialDate.minute,
              _initialDate.second,
              _initialDate.millisecond,
              _initialDate.microsecond)
          .toString();
    }
    return selectedDate;
  }

  void _addorUpdateJournal() {
    _journalEditBloc?.saveJournalChanged.add('save');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Entry',
          style: TextStyle(color: Colors.lightGreen.shade800),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        bottom: PreferredSize(
          child: Container(),
          preferredSize: Size.fromHeight(32),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.lightGreen, Colors.lightGreen.shade50],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder(
                  stream: _journalEditBloc?.dateEdit,
                  builder: (Context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return TextButton(
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 22,
                            color: Colors.black54,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            _formatDates?.dateFormatShortMonthDayYear(
                                    snapshot.data!) ??
                                '',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      onPressed: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        String _pickerDate = await _selectDate(snapshot.data!);
                        _journalEditBloc?.dateEditChanged.add(_pickerDate);
                      },
                    );
                  }),
              StreamBuilder(
                  stream: _journalEditBloc?.moodEdit,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    return DropdownButtonHideUnderline(
                        child: DropdownButton<MoodIcons>(
                      value: _moodIcons?.getMoodIconsList()[_moodIcons!
                          .getMoodIconsList()
                          .indexWhere((icon) => icon.title == snapshot.data)],
                      onChanged: (selected) {
                        _journalEditBloc?.moodEditChanged.add(selected!.title!);
                      },
                      items: _moodIcons
                          ?.getMoodIconsList()
                          .map((MoodIcons selected) {
                        return DropdownMenuItem<MoodIcons>(
                          value: selected,
                          child: Row(
                            children: [
                              Transform(
                                transform: Matrix4.identity()
                                  ..rotateZ(_moodIcons?.getMoodRotation(
                                          selected.title ?? '') ??
                                      0),
                                alignment: Alignment.center,
                                child: Icon(
                                  _moodIcons?.getMoodIcon(selected.title!),
                                  color:
                                      _moodIcons?.getMoodColor(selected.title!),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                selected.title!,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ));
                  }),
              StreamBuilder(
                stream: _journalEditBloc?.noteEdit,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();
                  _noteController?.value =
                      _noteController?.value.copyWith(text: snapshot.data) ??
                          TextEditingValue();
                  return TextField(
                    controller: _noteController,
                    textInputAction: TextInputAction.newline,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      labelText: 'Note',
                      icon: Icon(Icons.subject),
                    ),
                    maxLines: null,
                    onChanged: (note) =>
                        _journalEditBloc?.noteEditChanged.add(note),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'))
                ],
              ),
              SizedBox(
                width: 8,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.lightGreen.shade100),
                ),
                onPressed: () {
                  _addorUpdateJournal();
                },
                child: Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
