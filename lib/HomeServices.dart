import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:registration/timePicker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Services',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeServices(),
    );
  }
}

class HomeServices extends StatefulWidget {
  @override
  _HomeServicesState createState() => _HomeServicesState();
}

class _HomeServicesState extends State<HomeServices> {
  double _plumberElevation = 5.0;
  double _pestControlElevation = 5.0;
  double _electricianElevation = 5.0;
  double _cleaningElevation = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 40.0, left: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Home Services",
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
                  child: Lottie.asset('assets/homeservice.json',
                      fit: BoxFit.cover), // Update this path to your suitable Lottie file
                ),
                SizedBox(height: 10),
                _serviceTile(
                  title: "Plumber",
                  description: "Professional plumbing services for all your household needs.",
                  elevation: _plumberElevation,
onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _plumberElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },                ),
                SizedBox(height: 10),
                _serviceTile(
                  title: "Pest Control",
                  description: "Effective and safe pest control solutions.",
                  elevation: _pestControlElevation,
onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _plumberElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },                              ),
                SizedBox(height: 10),
                _serviceTile(
                  title: "Electrician",
                  description: "Qualified electricians for all your electrical needs.",
                  elevation: _electricianElevation,
onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _plumberElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },                              ),
                SizedBox(height: 10),
                _serviceTile(
                  title: "House Cleaning/Sanitization",
                  description: "Thorough cleaning and sanitization for a healthy home.",
                  elevation: _cleaningElevation,
onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _plumberElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },                              ),
                SizedBox(height: 20),
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
    return StatefulBuilder(builder: (BuildContext context, StateSetter setTileState) {
      return GestureDetector(
        onTapDown: (details) {
          setTileState(() {
            if (title == "Plumber") {
              _plumberElevation = 10.0;
            } else if (title == "Pest Control") {
              _pestControlElevation = 10.0;
            } else if (title == "Electrician") {
              _electricianElevation = 10.0;
            } else if (title == "House Cleaning/Sanitization") {
              _cleaningElevation = 10.0;
            }
          });
        },
        onTapCancel: () {
          setTileState(() {
            if (title == "Plumber") {
              _plumberElevation = 5.0;
            } else if (title == "Pest Control") {
              _pestControlElevation = 5.0;
            } else if (title == "Electrician") {
              _electricianElevation = 5.0;
            } else if (title == "House Cleaning/Sanitization") {
              _cleaningElevation = 5.0;
            }
          });
        },
        onTap: onTap,
        child: Card(
          elevation: elevation,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward, color: Theme.of(context).primaryColor),
              ],
            ),
          ),
        ),
      );
    });
  }
}
