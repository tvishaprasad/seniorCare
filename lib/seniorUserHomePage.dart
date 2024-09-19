import 'package:flutter/material.dart';
import 'package:registration/DoctorConsultation.dart';
import 'package:registration/EmergencyBooking.dart';
import 'package:registration/HomeHealthCare.dart';
import 'package:registration/HomeServices.dart';
import 'package:registration/Transportation.dart';
import 'package:registration/booking.dart';
import 'package:registration/medsupplies.dart';
import 'package:registration/plans.dart';
import 'main.dart';
import 'package:lottie/lottie.dart';
import 'package:registration/seniordeets.dart';
import 'package:registration/booking.dart';

class SeniorUserHomePage extends StatefulWidget {
  @override
  _SeniorUserHomePageState createState() => _SeniorUserHomePageState();
}

class _SeniorUserHomePageState extends State<SeniorUserHomePage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            MembershipPage(),
            HomePage(),
            HoldButtonPage(),
            BookingHistoryPage(),
            YourProfile(), // Connecting the ServicesListPage here
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30.0,
        selectedItemColor: Color(0xFF25a555),
        unselectedItemColor: Color(0xFF25a555).withOpacity(0.6),
        selectedLabelStyle: TextStyle(fontSize: 16),
        unselectedLabelStyle: TextStyle(fontSize: 14),
        items: [
  BottomNavigationBarItem(
    icon: Icon(Icons.calendar_today),
    label: 'Plans',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.build),
    label: 'Services',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.emergency_outlined, color:Colors.red),
    label: 'SOS',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.history),
    label: 'History',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.account_circle),
    label: 'Profile',
  ),
],

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ServiceItem> services = [
    ServiceItem(
      title: 'Emergency Services',
      description: 'Ambulance, Vaccinations',
      imageUrl:
          'https://www.pngall.com/wp-content/uploads/12/Emergency-Siren-PNG-File.png',
    ),
    ServiceItem(
      title: 'Transportation',
      description: 'Cab, Driver, Travel Assistance (Flights/Trains)',
      imageUrl:
          'https://static.vecteezy.com/system/resources/previews/019/907/568/original/car-graphic-clipart-design-free-png.png',
    ),
    ServiceItem(
      title: 'Home health Care',
      description:
          'Schedule Doctor Visit, Physio Therapy, Medical checkup, Blood test',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN70Q7A_sK2P0Fj0LAdWcsDUFODc-YyXqYNmgFUy5xb8h_mZRK6rMrbVBgDB6S6tg9USE&usqp=CAU',
    ),
    ServiceItem(
      title: 'Doctor Consultation',
      description:
          'Online Consultation, General Physician, Physiotherapist...',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGs40bI-pJTinUuMECStqpAEDuwhJY2iHabfhawf8XjWDOv8bOYZI5L_fLd7jRfVEPO_0&usqp=CAU',
    ),
    ServiceItem(
      title: 'Pharmacy',
      description: 'Medicines, Oxygen Tanks, Wheelchairs, Medical Equipment',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/975/975823.png',
    ),
    ServiceItem(
      title: 'Home services',
      description:
          'Plumber, Pest Control, Electrician, House Cleaning/Sanitsation',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/2249/2249538.png',
    ),
    //... [Add other services in the same format here]
  ];

  bool caregiverWanted = false;
  Set<String> caregiverServices = {};
  void _showInitialDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "Please select the desired services. Your choices will be highlighted. Once done, proceed to generate the bill.",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("Understood"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToServicePage(ServiceItem service) {
    switch (service.title) {
      case 'Emergency Services':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EmergencyBooking(),
        ));
        break;
      case 'Transportation':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TransportationServices(),
        ));
        break;
      case 'Home health Care':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeHealthCareServices(),
        ));
        break;
      case 'Doctor Consultation':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OnlineConsultation(),
        ));
        break;
      case 'Pharmacy':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MedicalSupplies(),
        ));
        break;
      case 'Home services':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeServices(),
        ));
        break;
      default:
        // Handle the case where an unknown service is selected.
        break;
    }
  }

  // void _showDescriptionDialog(String title, String description) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text(title),
  //       content: Text(description),
  //       actions: <Widget>[
  //         TextButton(
  //           child: Text("Close"),
  //           onPressed: () => Navigator.of(context).pop(),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // @override
  // @override
  // void initState() {
  //   super.initState();

  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _showInitialDialog();
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // IconButton(
                //   icon: Icon(Icons.menu,
                //       color: Theme.of(context).primaryColor, size: 30),
                //   onPressed: () {
                //     // Open drawer logic
                //   },
                // ),
                SizedBox(width: 48),
                Expanded(
                  child: Text(
                    'Senior Care Connect',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF25a555),
                    ),
                  ),
                  
                ),
                
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return GestureDetector(
                    onTap: () {
                        setState(() {
                          service.isSelected = !service.isSelected;
                        });
                        _navigateToServicePage(service);
                      },
                    child: Card(
                      elevation: service.isSelected ? 10.0 : 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      margin: EdgeInsets.only(
                        top: 8.0,
                        bottom: 8.0,
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: Row(
                        // Wrap ListTile in a Row
                        children: [
                          Expanded(
                            child: ListTile(
                              // Center the ListTile content horizontally
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              leading: Image.network(
                                service.imageUrl,
                                width: 64,
                                height: 64,
                              ),
                              title: Text(
                                service.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                service.description,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: 16.0), // Adjust the padding as needed
                            child: Icon(Icons.arrow_forward,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceItem {
  final String title;
  final String description;
  final String imageUrl;
  final double? price;
  bool isSelected = false;

  ServiceItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.price,
  });

  String get fullDescription {
    return '$description (Price: \$${price ?? 'Not available'})';
  }
}



class HoldButtonPage extends StatefulWidget {
  @override
  _HoldButtonPageState createState() => _HoldButtonPageState();
}

class _HoldButtonPageState extends State<HoldButtonPage> {
  bool _isHolding = false;
  int _countdownValue = 5;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onLongPressStart: (details) {
                setState(() {
                  _isHolding = true;
                });
                _startCountdown();
              },
              onLongPressEnd: (details) {
                setState(() {
                  _isHolding = false;
                });
              },
              child: Stack(
  alignment: Alignment.center,
  children: [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hold to activate.",
          style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        Lottie.asset('assets/emergency.json'),
      ],
    ),
  ],
),

            ),
            if (_isHolding)
              Text('$_countdownValue', style: TextStyle(fontSize: 60)),
          ],
        ),
      ),
    );
  }

  _startCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      if (_isHolding && _countdownValue > 0) {
        setState(() {
          _countdownValue--;
        });
        _startCountdown();
      } else if (_countdownValue == 0) {
        // Trigger the SOS or desired action here
        _resetCountdown();
      }
    });
  }

  _resetCountdown() {
    setState(() {
      _countdownValue = 5;
      _isHolding = false;
    });
  }

  void _showSOSInstructions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Emergency SOS'),
        content: Text('Hold the button for three seconds to activate SOS.'),
        actions: [
          TextButton(
            child: Text('Got it'),
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
          ),
        ],
      ),
    );
  }
}
