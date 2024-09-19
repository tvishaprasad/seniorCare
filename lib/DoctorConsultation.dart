import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'main.dart';
import 'timePicker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Consultation',
      theme: myTheme,
      home: OnlineConsultation(),
    );
  }
}

class OnlineConsultation extends StatefulWidget {
  @override
  _OnlineConsultationState createState() => _OnlineConsultationState();
}

class _OnlineConsultationState extends State<OnlineConsultation> {
  double _physicianElevation = 5.0;
  double _dermatologistElevation = 5.0;
  double _dentistElevation = 5.0;
  double _gynecologistElevation = 5.0;
  double _physiotherapistElevation = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, top: 40.0, left: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Online Consultation",
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
                child:
                    Lottie.asset('assets/doctorcons.json', fit: BoxFit.cover),
              ),
              SizedBox(height: 10),
              _serviceTile(
                title: "General Physician",
                description:
                    "Consult with experienced general physicians for your everyday health concerns.",
                elevation: _physicianElevation,
                onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _physicianElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },
              ),
              SizedBox(height: 10),
              _serviceTile(
                title: "Dermatologist",
                description:
                    "Connect with skin care specialists to address your skin-related issues.",
                elevation: _dermatologistElevation,
                onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _physicianElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },
              ),
              SizedBox(height: 10),
              _serviceTile(
                title: "Dentist",
                description:
                    "Get oral care solutions from certified dentistry professionals.",
                elevation: _dentistElevation,
                onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _physicianElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },
              ),
              SizedBox(height: 10),
              _serviceTile(
                title: "Gynecologist",
                description:
                    "Discuss women's health and reproductive concerns with expert gynecologists.",
                elevation: _gynecologistElevation,
                onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _physicianElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },
              ),
              SizedBox(height: 10),
              _serviceTile(
                title: "Physiotherapist",
                description:
                    "Online therapy sessions with skilled physiotherapists for muscle and joint care.",
                elevation: _physiotherapistElevation,
                onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _physicianElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
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
            if (title == "General Physician") {
              _physicianElevation = 10.0;
            } else if (title == "Dermatologist") {
              _dermatologistElevation = 10.0;
            } else if (title == "Dentist") {
              _dentistElevation = 10.0;
            } else if (title == "Gynecologist") {
              _gynecologistElevation = 10.0;
            } else if (title == "Physiotherapist") {
              _physiotherapistElevation = 10.0;
            }
          });
        },
        onTapCancel: () {
          setTileState(() {
            if (title == "General Physician") {
              _physicianElevation = 5.0;
            } else if (title == "Dermatologist") {
              _dermatologistElevation = 5.0;
            } else if (title == "Dentist") {
              _dentistElevation = 5.0;
            } else if (title == "Gynecologist") {
              _gynecologistElevation = 5.0;
            } else if (title == "Physiotherapist") {
              _physiotherapistElevation = 5.0;
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
