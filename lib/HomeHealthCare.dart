import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:registration/timePicker.dart';
import 'main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Health Care Services',
      theme: myTheme,
      home: HomeHealthCareServices(),
    );
  }
}

class HomeHealthCareServices extends StatefulWidget {
  @override
  _HomeHealthCareServicesState createState() => _HomeHealthCareServicesState();
}

class _HomeHealthCareServicesState extends State<HomeHealthCareServices> {
  double _doctorVisitElevation = 5.0;
  double _physioTherapyElevation = 5.0;
  double _medicalCheckupElevation = 5.0;
  double _bloodTestElevation = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 40.0, left: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Home Health Care Services",
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
                  child: Lottie.asset('assets/homehealthcare.json',
                      fit: BoxFit.cover),
                ),
                SizedBox(height: 10),
                _serviceTile(
                  title: "Schedule Doctor Visit to Home",
                  description: "Convenient doctor visits right at your home.",
                  elevation: _doctorVisitElevation,
                  onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _physioTherapyElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },
                ),
                SizedBox(height: 10),
                _serviceTile(
                  title: "Physio Therapy",
                  description:
                      "Professional physiotherapy sessions to ensure your well-being.",
                  elevation: _physioTherapyElevation,
onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _physioTherapyElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },                ),
                SizedBox(height: 10),
                _serviceTile(
                  title: "Medical Checkup",
                  description:
                      "Comprehensive medical checkups ensuring thorough health analysis.",
                  elevation: _medicalCheckupElevation,
onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _physioTherapyElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },                ),
                SizedBox(height: 10),
                _serviceTile(
                  title: "Blood Test",
                  description: "Quick and reliable blood testing services.",
                  elevation: _bloodTestElevation,
onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _physioTherapyElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },                ),
                SizedBox(height: 30),
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
            if (title == "Schedule Doctor Visit to Home") {
              _doctorVisitElevation = 10.0;
            } else if (title == "Physio Therapy") {
              _physioTherapyElevation = 10.0;
            } else if (title == "Medical Checkup") {
              _medicalCheckupElevation = 10.0;
            } else if (title == "Blood Test") {
              _bloodTestElevation = 10.0;
            }
          });
        },
        onTapCancel: () {
          setTileState(() {
            if (title == "Schedule Doctor Visit to Home") {
              _doctorVisitElevation = 5.0;
            } else if (title == "Physio Therapy") {
              _physioTherapyElevation = 5.0;
            } else if (title == "Medical Checkup") {
              _medicalCheckupElevation = 5.0;
            } else if (title == "Blood Test") {
              _bloodTestElevation = 5.0;
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
