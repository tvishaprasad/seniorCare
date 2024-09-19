import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:registration/seniorUserHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showDetails = false;
  bool showHeading = false;
  bool showScreenshotText = false;

  void toggleDetails() {
    setState(() {
      showDetails = !showDetails;
      if (showDetails) {
        showScreenshotText = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        showHeading = true;
      });
    });

    Future.delayed(Duration(milliseconds: 3000), () {
      toggleDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Make the background transparent
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 150, // Adjust the top value as needed
            left: 0,
            right: 0,
            child: Lottie.asset(
              'assets/yourCaregiver.json', // Adjust the path as per your actual file
              repeat: false,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: showHeading ? 1.0 : 0.0,
                  child: Text(
                    "Here's your caregiver!",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: toggleDetails,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    width: showDetails ? 130.0 : 200.0,
                    height: showDetails ? 130.0 : 200.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        'https://tr.rbxcdn.com/45724348abc51dbcfc0a93a0057032b7/420/420/Hat/Png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: showDetails ? 1.0 : 0.0,
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'John Doe',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Phone: 123-456-7890',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: showScreenshotText ? 1.0 : 0.0,
                  child: Text(
                    'Please take a screenshot of this for later',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
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
                // Handle button click
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeniorUserHomePage()),
                );
              },
              child: Text('Back to Home',style: TextStyle(fontSize: 18.0),),
            ),
          ),
        ],
      ),
    );
  }
}