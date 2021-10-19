import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

class calendarioPage extends StatefulWidget {
  @override
  _calendarioPageState createState() => _calendarioPageState();
  static final String routeName = 'calendario';
}

class _calendarioPageState extends State<calendarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario'),
      ),
      body: Container(
        child: SfCalendar(
          view: CalendarView.month,
          monthViewSettings: MonthViewSettings(showAgenda: true),
        ),
      ),
    );
  }
}
