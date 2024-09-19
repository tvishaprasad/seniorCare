import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'paymentPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDatePicker(),
    );
  }
}

class WebviewScreen extends StatelessWidget {
  final String url;

  WebviewScreen({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AI Health Checker"),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
class MyDatePicker extends StatefulWidget {
  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime initialDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  DateTime selectedMonth = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  List<TimeRange> timeRanges = [
    TimeRange(start: TimeOfDay(hour: 0, minute: 0), end: TimeOfDay(hour: 8, minute: 0)),
    TimeRange(start: TimeOfDay(hour: 8, minute: 0), end: TimeOfDay(hour: 12, minute: 0)),
    TimeRange(start: TimeOfDay(hour: 12, minute: 0), end: TimeOfDay(hour: 16, minute: 0)),
    TimeRange(start: TimeOfDay(hour: 16, minute: 0), end: TimeOfDay(hour: 0, minute: 0)),
  ];

  TimeRange? selectedTimeRange;
  String additionalInstructions = '';


  @override
  Widget build(BuildContext context) {
    int daysInMonth = DateTime(selectedMonth.year, selectedMonth.month + 1, 0).day;

    return Scaffold(
      
      body: Padding(padding: EdgeInsets.only(top:48.0,left:8.0,right: 8.0),
      child:
      SingleChildScrollView( // Wrap the content in a SingleChildScrollView
        child: Column(
        children: <Widget>[
          // Add the MonthPicker widget here
          MonthPicker(
            initialDate: initialDate,
            selectedDate: selectedMonth,
            onMonthSelected: (DateTime month) {
              setState(() {
                selectedMonth = month;
                // Ensure selectedDate is in the future relative to the selected month
                selectedDate = DateTime.now().isAfter(selectedMonth)
                    ? DateTime.now()
                    : selectedMonth;
              });
            },
          ),
          SizedBox(height: 8),
          Divider(
            height: 1,
            color: Colors.black,
          ),
          Row(
            children: [
              Container(
                width: 80,
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text("Date", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: daysInMonth,
                    itemBuilder: (context, index) {
                      final day = DateTime(selectedMonth.year, selectedMonth.month, index + 1);
                      return DateItem(
                        date: day,
                        isSelected: day == selectedDate,
                        onSelect: () {
                          setState(() {
                            selectedDate = day;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(
            height: 1,
            color: Colors.black,
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 80,
                height: 100,
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text("Time", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: timeRanges.length,
                    itemBuilder: (context, index) {
                      final timeRange = timeRanges[index];
                      return TimeRangeItem(
                        timeRange: timeRange,
                        timeRanges: timeRanges,
                        isSelected: timeRange == selectedTimeRange,
                        onSelect: () {
                          setState(() {
                            selectedTimeRange = timeRange;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 48), // Add spacing
          
          Text('Any Additional Instructions?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
          SizedBox(height: 16), // Add spacing
          Padding(padding: EdgeInsets.only(left:20.0,right: 20.0),
          child:
TextField(
  decoration: InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(
        color: Colors.green,
        width: 2.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(
        color: Colors.grey, // Grey border color
        width: 2.0,
      ),
    ),
    hintText: "Additional instructions",
  ),
  maxLines: 5,
  onChanged: (value) {
    setState(() {
      additionalInstructions = value;
    });
  },
),),
 SizedBox(height: 32), // Add spacing
          
          Text('Feel free to use our AI health checker tool!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),

SizedBox(height: 16), // Add spacing

ElevatedButton(
  style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(160, 45)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
  onPressed: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WebviewScreen(url: 'https://eand.careplix.com'),
      ),
    );
  },
  child: Text('AI Health Checker',style: TextStyle(fontSize: 16.0),),
),



SizedBox(height: 16), // Add spacing
ElevatedButton(
  style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(160, 45)),
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentPage()),
    );
 
    // Add the action you want the button to perform when pressed
  },
  child: Text('Send Request',style: TextStyle(fontSize: 16.0),),
),
SizedBox(height: 32),

        ],
      ),
    )));
  }
}

// ... (Rest of the code remains the same)


class DateItem extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final VoidCallback onSelect;

  DateItem({
    required this.date,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isEnabled = date.isAfter(now);

    return GestureDetector(
      onTap: isEnabled ? onSelect : null,
      child: Container(
        width: 70,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8.0,
                    spreadRadius: 1.0,
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            "${date.day}",
            style: TextStyle(
              fontSize: 18,
              color: isSelected ? Colors.white : (isEnabled ? Colors.black : Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}

class TimeRange {
  final TimeOfDay start;
  final TimeOfDay end;

  TimeRange({
    required this.start,
    required this.end,
  });
}

class TimeRangeItem extends StatelessWidget {
  final TimeRange timeRange;
  final List<TimeRange> timeRanges;
  final bool isSelected;
  final VoidCallback onSelect;

  TimeRangeItem({
    required this.timeRange,
    required this.timeRanges,
    required this.isSelected,
    required this.onSelect,
  });

  String getAssetPathForTimeRange(TimeRange timeRange) {
    // Map each time range to its corresponding asset path.
    if (timeRange == timeRanges[0]) {
      return 'assets/sunrise.png';
    } else if (timeRange == timeRanges[1]) {
      return 'assets/morning.png';
    } else if (timeRange == timeRanges[2]) {
      return 'assets/noon.png';
    } else if (timeRange == timeRanges[3]) {
      return 'assets/sunset.png';
    } else {
      return 'assets/default.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    final assetPath = getAssetPathForTimeRange(timeRange);

    return GestureDetector(
      onTap: onSelect,
      child: Container(
        width: 100,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8.0,
                    spreadRadius: 1.0,
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetPath,
              width: 48,
              height: 48,
              color: isSelected ? Colors.white : Colors.black,
            ),
            Text(
              "${formatTime(timeRange.start)} - ${formatTime(timeRange.end)}",
              style: TextStyle(
                fontSize: 14,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod;
    //final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'am' : 'pm';
    return '$hour $period';
  }
}
class MonthPicker extends StatelessWidget {
  final DateTime initialDate;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onMonthSelected;

  MonthPicker({
    required this.initialDate,
    required this.selectedDate,
    required this.onMonthSelected,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final availableMonths = List.generate(6, (index) {
      final month = DateTime(now.year, now.month + index);
      return month;
    });

    return Row(
      children: <Widget>[
        Container(
          width: 80,
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text(
            "Month",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
        ),
        Expanded(
          child: Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: availableMonths.length,
              itemBuilder: (context, index) {
                final month = availableMonths[index];
                return MonthItem(
                  month: month,
                  isSelected: month.year == selectedDate.year &&
                      month.month == selectedDate.month,
                  isSelectable: month.isAfter(now) || (month.year == now.year && month.month == now.month),
                  onSelect: () {
                    if (month.isAfter(now) || (month.year == now.year && month.month == now.month)) {
                      onMonthSelected(month);
                    }
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MonthItem extends StatelessWidget {
  final DateTime month;
  final bool isSelected;
  final bool isSelectable;
  final VoidCallback onSelect;

  MonthItem({
    required this.month,
    required this.isSelected,
    required this.isSelectable,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSelectable ? onSelect : null,
      child: Container(
        width: 90,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8.0,
                    spreadRadius: 1.0,
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            DateFormat.MMM().format(month),
            style: TextStyle(
              fontSize: 18,
              color: isSelected ? Colors.white : (isSelectable ? Colors.black : Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}