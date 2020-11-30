import 'package:flutter/material.dart';
import 'package:calendar_strip/calendar_strip.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateTime.now().subtract(Duration(days: 4));
    DateTime endDate = DateTime.now().add(Duration(days: 4));
    List<DateTime> markedDates = [];

    onSelect(data) {
      print("Selected Date -> $data");
    }

    onWeekSelect(data) {
      print("Selected week starting at -> $data");
    }

    getMarkedIndicatorWidget() {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.only(left: 1, right: 1),
          width: 7,
          height: 7,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        ),
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        )
      ]);
    }

    dateTileBuilder(
        date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
      bool isSelectedDate = date.compareTo(selectedDate) == 0;
      Color fontColor = isDateOutOfRange ? Colors.black26 : Colors.black87;
      TextStyle normalStyle = TextStyle(
          fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
      TextStyle selectedStyle = TextStyle(
          fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
      TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);
      TextStyle dayNameStyleSelected =
          TextStyle(fontSize: 14.5, color: fontColor);
      List<Widget> _children = [
        Text(dayName,
            style: !isSelectedDate ? dayNameStyle : dayNameStyleSelected),
        Text(date.day.toString(),
            style: !isSelectedDate ? normalStyle : selectedStyle),
      ];

      if (isDateMarked == true) {
        _children.add(getMarkedIndicatorWidget());
      }

      return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
        decoration: BoxDecoration(
            color: !isSelectedDate ? Colors.transparent : Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: isSelectedDate
                ? Border.all(color: Colors.grey[400], width: 1)
                : null,
            boxShadow: isSelectedDate
                ? [
                    BoxShadow(
                        blurRadius: 6,
                        color: Colors.grey[300],
                        offset: Offset(2, 2),
                        spreadRadius: 1)
                  ]
                : []),
        child: Column(
          children: _children,
        ),
      );
    }

    _monthNameWidget(monthName) {
      return Container();
    }

    return Container(
      child: CalendarStrip(
        addSwipeGesture: true,
        startDate: startDate,
        endDate: endDate,
        onDateSelected: onSelect,
        onWeekSelected: onWeekSelect,
        dateTileBuilder: dateTileBuilder,
        iconColor: Colors.black87,
        monthNameWidget: _monthNameWidget,
        markedDates: markedDates,
      ),
    );
  }
}
