import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatefulWidget {
  final void Function(int daySelected) onDaySelected;
  const CalendarWidget({super.key, required this.onDaySelected});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  // Get the current month and year
  String monthName = DateFormat.MMMM().format(DateTime.now());
  String yearNow = DateFormat.y().format(DateTime.now());
  

  late final DateTime currentDate;
  late final DateTime firstDayOfMonth;
  late final DateTime firstDayOfNextMonth;
  int daySelected = DateTime.now().day;
  List<DateTime> daysInMonth = [];
  generateDayInTheMotn() {
    for (DateTime day = firstDayOfMonth;
        day.isBefore(firstDayOfNextMonth);
        day = day.add(const Duration(days: 1))) {
      // Adicione apenas os dias que ainda não passaram
      if (day.isAfter(currentDate.subtract(const Duration(days: 1)))) {
        daysInMonth.add(day);
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentDate = DateTime.now();
      firstDayOfMonth = DateTime(currentDate.year, currentDate.month, 1);
      firstDayOfNextMonth =
          DateTime(currentDate.year, currentDate.month + 1, 1);
      generateDayInTheMotn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Row(
        children: [
          Text(
            "$monthName\n$yearNow",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: daysInMonth.length,
              itemBuilder: (_, index) {
                final dayInList = daysInMonth[index].day;
                return GestureDetector(
                  onTap: () {
                    widget.onDaySelected(dayInList);
                    setState(() {
                      daySelected = dayInList;
                    });
                  },
                  child: Container(
                    width: 32,
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: Center(
                      child: Text(
                        dayInList.toString(),
                        style: TextStyle(
                            color: dayInList == daySelected
                                ? Colors.white
                                : Colors.grey),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
