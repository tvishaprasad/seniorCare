import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:registration/timePicker.dart';
import 'main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergency Booking',
      theme: myTheme,
      home: EmergencyBooking(),
    );
  }
}

class EmergencyBooking extends StatefulWidget {
  @override
  _EmergencyBookingState createState() => _EmergencyBookingState();
}

class _EmergencyBookingState extends State<EmergencyBooking> {
  double _ambulanceElevation = 5.0;
  double _vaccinationElevation = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0,top: 40.0,left:16.0),
        child: SingleChildScrollView(
          child: Column(
          children: [
            Text(
              "Emergency Booking",
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
                child: Lottie.asset('assets/ambulance.json', fit: BoxFit.cover),
              ),
            
            SizedBox(height: 10),
            _serviceTile(
              title: "Ambulance Booking",
              description:
                  "Prompt ambulance services with ensured patient safety and timely care.",
              elevation: _ambulanceElevation,
              onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _ambulanceElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },
            ),
            SizedBox(height: 20),
            _serviceTile(
              title: "Vaccination Booking",
              description:
                  "Efficient vaccination scheduling with convenient appointments and essential information.",
              elevation: _vaccinationElevation,
             onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _ambulanceElevation = 5.0;
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
    ));
  }

  Widget _serviceTile(
      {required String title,
      required String description,
      required double elevation,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTapDown: (details) {
        if (title == "Ambulance Booking") {
          setState(() => _ambulanceElevation = 10.0);
        } else {
          setState(() => _vaccinationElevation = 10.0);
        }
      },
      onTapCancel: onTap,
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade600),
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
  }
}
