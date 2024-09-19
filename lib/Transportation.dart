import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:registration/timePicker.dart';
import 'main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transportation Services',
      theme: myTheme,
      home: TransportationServices(),
    );
  }
}

class TransportationServices extends StatefulWidget {
  @override
  _TransportationServicesState createState() => _TransportationServicesState();
}

class _TransportationServicesState extends State<TransportationServices> {
  double _cabElevation = 5.0;
  double _driverElevation = 5.0;
  double _travelAssistanceElevation = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 40.0, left: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Transportation Services",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF25a555),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Container(
                  height: 350,
                  child: Lottie.asset('assets/transportation.json',
                      fit: BoxFit.cover), // Assuming you have a transportation lottie animation.
                ),
                SizedBox(height: 10),
                _serviceTile(
                  title: "Cab",
                  description: "Quick and reliable cab services for short and long rides.",
                  elevation: _cabElevation,
onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _cabElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },                        ),
                SizedBox(height: 10),
                _serviceTile(
                  title: "Driver",
                  description: "Professional drivers for long distance travels ensuring a comfortable journey.",
                  elevation: _driverElevation,
onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _driverElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },                       ),
                SizedBox(height: 10),
                _serviceTile(
                  title: "Travel Assistance",
                  description: "Complete assistance for flight and train bookings, ensuring a hassle-free travel experience.",
                  elevation: _travelAssistanceElevation,
onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _travelAssistanceElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },                       ),
                SizedBox(height: 30)
              ],
            ),
          )),
    );
  }

  Widget _serviceTile({
    required String title,
    required String description,
    required double elevation,
    required VoidCallback onTap,
  }) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setTileState) {
      return GestureDetector(
        onTapDown: (details) {
          setTileState(() {
            if (title == "Cab") {
              _cabElevation = 10.0;
            } else if (title == "Driver") {
              _driverElevation = 10.0;
            } else if (title == "Travel Assistance") {
              _travelAssistanceElevation = 10.0;
            }
          });
        },
        onTapCancel: () {
          setTileState(() {
            if (title == "Cab") {
              _cabElevation = 5.0;
            } else if (title == "Driver") {
              _driverElevation = 5.0;
            } else if (title == "Travel Assistance") {
              _travelAssistanceElevation = 5.0;
            }
          });
        },
        onTap: onTap,
        child: Card(
          elevation: elevation,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward,
                    color: Theme.of(context).primaryColor),
              ],
            ),
          ),
        ),
      );
    });
  }
}
