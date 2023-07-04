import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Event {
  final String title;
  final DateTime dataHoraInicio;
  final DateTime dataHoraFim;

  const Event(this.title, this.dataHoraInicio, this.dataHoraFim);

  @override
  String toString() => title;
}

class EventosView extends StatefulWidget {
  @override
  State<EventosView> createState() => _EventosViewState();
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final _kEventSource = Map.fromIterable(List.generate(35, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
          item % 4 + 1,
          (index) => Event(
              'Event $item | ${index + 1}',
              DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
              DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5)),
        ))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1', kToday, kToday),
      Event('Today\'s Event 2', kToday, kToday),
    ],
  });

final events = LinkedHashMap(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

class _EventosViewState extends State<EventosView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay = DateTime.now();

  late List<Event>? eventsOfDay = _getEventsForDay(DateTime.now());

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eventos"),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 0,
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              eventLoader: (day) {
                return _getEventsForDay(day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  print(selectedDay);
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  eventsOfDay = _getEventsForDay(selectedDay);
                });
              },
            ),
          ),
          Flexible(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: eventsOfDay?.length,
                //_getEventsForDay(_selectedDay!).length,
                itemBuilder: (context, i) {
                  return Card(
                    margin: EdgeInsets.all(12),
                    elevation: 4,
                    child: Column(
                      children: [
                        Text(
                          "${eventsOfDay?[i].title}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text('${DateFormat('dd/MM/yyyy').format(_focusedDay)}'),
                        Text(
                            '${DateFormat('hh:mm').format(eventsOfDay![i].dataHoraInicio!)} - ${DateFormat('hh:mm').format(eventsOfDay![i].dataHoraFim!)}'),
                        Image.asset(
                          "assets/images/background(${(i % 12)+1}).jpg",
                          width: MediaQuery.of(context).size.width * 0.85,
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
