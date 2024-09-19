import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:registration/timePicker.dart';
import 'main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Supplies',
      theme: myTheme,
      home: MedicalSupplies(),
    );
  }
}

class MedicalSupplies extends StatefulWidget {
  @override
  _MedicalSuppliesState createState() => _MedicalSuppliesState();
}

class _MedicalSuppliesState extends State<MedicalSupplies> {
  double _medicinesElevation = 5.0;
  double _oxygenTanksElevation = 5.0;
  double _wheelchairsElevation = 5.0;
  double _medicalEquipmentsElevation = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, top: 40.0, left: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Medical Supplies",
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
                child: Lottie.asset('assets/medsup.json', fit: BoxFit.cover),
              ),
              SizedBox(height: 10),
              _serviceTile(
                title: "Medicines",
                description: "A wide range of essential medicines for various health conditions.",
                elevation: _medicinesElevation,
onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _oxygenTanksElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },                            ),
              SizedBox(height: 10),
              _serviceTile(
                title: "Oxygen Tanks",
                description: "Reliable oxygen tanks to cater to your medical needs.",
                elevation: _oxygenTanksElevation,
onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _oxygenTanksElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },                      ),
              SizedBox(height: 10),
              _serviceTile(
                title: "Wheelchairs",
                description: "Comfortable and durable wheelchairs to enhance mobility.",
                elevation: _wheelchairsElevation,
onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _oxygenTanksElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },                      ),
              SizedBox(height: 10),
              _serviceTile(
                title: "Medical Equipments",
                description: "High-quality medical equipment for comprehensive healthcare.",
                elevation: _medicalEquipmentsElevation,
onTap: () {
                  // When the widget is tapped, update the elevation to 5.0
                  setState(() {
                    _oxygenTanksElevation = 5.0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDatePicker()),
                  );
                },                      ),
              SizedBox(height: 30),
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
            if (title == "Medicines") {
              _medicinesElevation = 10.0;
            } else if (title == "Oxygen Tanks") {
              _oxygenTanksElevation = 10.0;
            } else if (title == "Wheelchairs") {
              _wheelchairsElevation = 10.0;
            } else if (title == "Medical Equipments") {
              _medicalEquipmentsElevation = 10.0;
            }
          });
        },
        onTapCancel: () {
          setTileState(() {
            if (title == "Medicines") {
              _medicinesElevation = 5.0;
            } else if (title == "Oxygen Tanks") {
              _oxygenTanksElevation = 5.0;
            } else if (title == "Wheelchairs") {
              _wheelchairsElevation = 5.0;
            } else if (title == "Medical Equipments") {
              _medicalEquipmentsElevation = 5.0;
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
