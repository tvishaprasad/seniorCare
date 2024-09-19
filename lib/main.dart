// ignore: unused_import
import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';

//import 'package:flutter/material.dart';
//import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'seniorUserHomePage.dart';

//import 'package:flutter/material.dart';

void main() => runApp(MyApp());
final Color customPrimaryColor = Color(0xFF25a555);
final Color customSecondaryColor = Color(0xFFffa100);

final ThemeData myTheme = ThemeData(
  androidOverscrollIndicator: AndroidOverscrollIndicator.stretch, // For Android
  primaryColor: customPrimaryColor, // Set your custom primary color
  secondaryHeaderColor: customSecondaryColor, // Set your custom secondary color
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash to Registration',
      theme: myTheme,
      home: AnimatedSplashScreen(),
    );
  }
}

class AnimatedSplashScreen extends StatefulWidget {
  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    // Navigating to the UserTypeSelectionPage after a delay
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => UserTypeSelectionPage()),
      );
    });
  }

  void _openFeedbackForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Feedback Form"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Enter your feedback'),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text("Submit"),
            onPressed: () {
              Navigator.of(context).pop(); // Mock submission, close the dialog
            },
          ),
          TextButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("John Doe"),
              accountEmail: Text("johndoe@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/100?text=User'),
              ),
            ),
            ListTile(
              title: Text('Feedback'),
              onTap: () {
                Navigator.of(context).pop();
                _openFeedbackForm(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _controller,
              child: Text(
                'SeniorCare',
                style: TextStyle(
                  fontFamily: 'Vintage Valentine',
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF25a555),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeTransition(
                  opacity: _controller,
                  child: Text(
                    'Connect',
                    style: TextStyle(
                      fontFamily: 'Vintage Valentine',
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF25a555),
                    ),
                  ),
                ),
                IconTheme(
                  data: new IconThemeData(
                    color: Colors.black,
                  ),
                  child: Icon(Icons.star, color: Colors.amber[700], size: 41),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class UserTypeSelectionPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.menu,
                      color: Color(0xFF25a555), size: 30), // Bigger Icon
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
                Text(
                  'Senior User Login',
                  style: TextStyle(
                    fontSize: 24, // Increased font size
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF25a555),
                  ),
                ),
                SizedBox(width: 50), // This is to balance the row layout
              ],
            ),
            SizedBox(height: 30),
            TextField(
              style: TextStyle(fontSize: 22), // Bigger text size
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                    fontSize: 22, color: Colors.black), // Increased font size
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              style: TextStyle(fontSize: 22), // Bigger text size
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                    fontSize: 22, color: Colors.black), // Increased font size
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    // Implement navigation to a "Forgot Password" page or functionality
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: Color(0xFF25a555),
                        fontSize: 20), // Increased font size
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Here's where you might put authentication checks in the future
                Navigator.pushReplacement(
                  // using pushReplacement to replace the login screen in the stack
                  context,
                  MaterialPageRoute(builder: (context) => SeniorUserHomePage()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF25a555)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                minimumSize: MaterialStateProperty.all(Size(50.0, 50.0)),
              ),
              child: Text('Login', style: TextStyle(fontSize: 22)),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account? ',
                    style: TextStyle(fontSize: 18)), // Bigger text
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationPage()),
                    );
                  },
                  child: Text('Register here',
                      style: TextStyle(
                          color: Colors.black, fontSize: 18)), // Bigger text
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF25a555),
              ),
              child: Text(
                'Caregiver Options',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30, // Bigger text
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Caregiver Login',
                  style: TextStyle(fontSize: 20)), // Bigger text
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CaregiverLoginPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Caregiver Registration',
                  style: TextStyle(fontSize: 20)), // Bigger text
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CRegistrationPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CaregiverLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color roseGold = Color(0xFF25a555); // Your color

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: roseGold),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  'Caregiver Login',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: roseGold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 50), // to balance the row
              ],
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(fontSize: 22, color: Colors.black),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(fontSize: 22, color: Colors.black),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    // Implement navigation to a "Forgot Password" page or functionality
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(color: roseGold, fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              width: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Mocked login functionality.
                  bool isAuthenticated = true; // This is just a mock

                  if (isAuthenticated) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CaregiverHomePage()),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(roseGold),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                  minimumSize: MaterialStateProperty.all(Size(50.0, 50.0)),
                ),
                child: Text('Login', style: TextStyle(fontSize: 22)),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account? ',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CRegistrationPage()), // Assuming you have a CaregiverRegistrationPage
                    );
                  },
                  child: Text(
                    'Register here',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String? username, password, confirmPassword;
  final usernameController = TextEditingController();
  bool isUsernameAvailable = false;
  bool isCheckingUsername =
      false; // Used to show a loading indicator when checking username

  final ImagePicker _picker = ImagePicker();
  String? firstName, middleName, lastName;
  int? birthYear, birthMonth, birthDay;
  String? dietPreferences;
  String? emailID;
  String? phoneno;
  String? address;
  String? city;
  String? pincode;
  String? med;
  String? ec;
  Future<void> _pickImage() async {
    await _picker.getImage(source: ImageSource.gallery);
  }

  // Add other fields...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('Senior User Registration',
                style: TextStyle(fontSize: 24.0))),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Personal Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'First name*',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your First Name';
                      }
                      return null;
                    },
                    onSaved: (value) => firstName = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Middle Name',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    onSaved: (value) => middleName = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Last Name*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Last Name';
                      }
                      return null;
                    },
                    onSaved: (value) => lastName = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Username*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    onSaved: (value) => username = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Password*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      } else if (value.length > 10) {
                        return 'Password should not be more than 10 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),

                  // ...

                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Confirm Password*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      } else if (value.length > 10) {
                        return 'Password should not be more than 10 characters';
                      }
                      return null;
                    },
                  ),

// ...

                  DropdownButtonFormField<int>(
                    items: List.generate(DateTime.now().year - 1939, (index) {
                      int year = 1940 + index;
                      return DropdownMenuItem(
                          value: year, child: Text("$year"));
                    }),
                    onChanged: (value) => birthYear = value,
                    decoration: InputDecoration(labelText: 'Birth Year*'),
                  ),
                  DropdownButtonFormField<int>(
                    items: List.generate(12, (index) {
                      return DropdownMenuItem(
                          value: index + 1, child: Text("${index + 1}"));
                    }),
                    onChanged: (value) => birthMonth = value,
                    decoration: InputDecoration(labelText: 'Birth Month*'),
                  ),
                  DropdownButtonFormField<int>(
                    items: List.generate(31, (index) {
                      return DropdownMenuItem(
                          value: index + 1, child: Text("${index + 1}"));
                    }),
                    onChanged: (value) => birthDay = value,
                    decoration: InputDecoration(labelText: 'Birth Day*'),
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Email ID*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email ID';
                      }
                      // You can add more validations for email like checking if it contains '@'
                      return null;
                    },
                    onSaved: (value) => emailID = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Contact number*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your contact number';
                      }
                      return null;
                    },
                    onSaved: (value) => phoneno = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Address Line 1 *',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    onSaved: (value) => address = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Address (Line 2)',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    onSaved: (value) => lastName = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'City *',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your City';
                      }
                      return null;
                    },
                    onSaved: (value) => city = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Pincode*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your pinocde';
                      }
                      return null;
                    },
                    onSaved: (value) => pincode = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Medical History of User*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter medical history of user';
                      }
                      return null;
                    },
                    onSaved: (value) => med = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Family Member Name*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    onSaved: (value) => lastName = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Emergency Contact Number*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your emergency contact';
                      }
                      return null;
                    },
                    onSaved: (value) => ec = value,
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Diet Preferences*',
                      hintText:
                          'E.g.\nBreakfast: Oats\nLunch: Salad\nSnacks:Tea and Biscuits\nDinner:Millets...',
                    ),
                    style: TextStyle(fontSize: 20.0),
                    maxLines: 8,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your diet preferences';
                      }
                      return null;
                    },
                    onSaved: (value) => dietPreferences = value,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: Text('Select Photo ID from Gallery*',
                        style: TextStyle(fontSize: 20.0)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      // Increased padding to make the button larger
                    ),
                  ),
                  SizedBox(height: 10),

                  // ... Continue with other form fields

                  // ... Continue with other fields ...

                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit', style: TextStyle(fontSize: 20.0)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(
                          15), // Increased padding to make the button larger
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('You\'ve logged in!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill in all required fields.')));
    }
  }
}

class CRegistrationPage extends StatefulWidget {
  @override
  _CRegistrationPageState createState() => _CRegistrationPageState();
}

class _CRegistrationPageState extends State<CRegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String? username, password, confirmPassword;
  final usernameController = TextEditingController();
  bool isUsernameAvailable = false;
  bool isCheckingUsername =
      false; // Used to show a loading indicator when checking username

  final ImagePicker _picker = ImagePicker();
  String? firstName, middleName, lastName;
  int? birthYear, birthMonth, birthDay;
  String? dietPreferences;
  String? emailID;
  String? phoneno;
  String? address;
  String? city;
  String? pincode;
  String? experience;

  Future<void> _pickImage() async {
    await _picker.getImage(source: ImageSource.gallery);
  }

  // Add other fields...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF25a555), // Navy blue
          title: Text('Caregiver Registration',
              style: TextStyle(fontSize: 24.0, color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Personal Details",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF25a555))),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'First name*',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your First Name';
                      }
                      return null;
                    },
                    onSaved: (value) => firstName = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Middle Name',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    onSaved: (value) => middleName = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Last Name*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Last Name';
                      }
                      return null;
                    },
                    onSaved: (value) => lastName = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Username*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    onSaved: (value) => username = value,
                  ),
                  SizedBox(height: 10),

                  // ...

                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Confirm Password*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      } else if (value.length > 10) {
                        return 'Password should not be more than 10 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),

// ...

                  DropdownButtonFormField<int>(
                    items: List.generate(DateTime.now().year - 1939, (index) {
                      int year = 1940 + index;
                      return DropdownMenuItem(
                          value: year, child: Text("$year"));
                    }),
                    onChanged: (value) => birthYear = value,
                    decoration: InputDecoration(labelText: 'Birth Year*'),
                  ),
                  DropdownButtonFormField<int>(
                    items: List.generate(12, (index) {
                      return DropdownMenuItem(
                          value: index + 1, child: Text("${index + 1}"));
                    }),
                    onChanged: (value) => birthMonth = value,
                    decoration: InputDecoration(labelText: 'Birth Month*'),
                  ),
                  DropdownButtonFormField<int>(
                    items: List.generate(31, (index) {
                      return DropdownMenuItem(
                          value: index + 1, child: Text("${index + 1}"));
                    }),
                    onChanged: (value) => birthDay = value,
                    decoration: InputDecoration(labelText: 'Birth Day*'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Email ID*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email ID';
                      }
                      // You can add more validations for email like checking if it contains '@'
                      return null;
                    },
                    onSaved: (value) => emailID = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Contact number*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your contact number';
                      }
                      return null;
                    },
                    onSaved: (value) => phoneno = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Address Line 1 *',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    onSaved: (value) => address = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Address (Line 2)',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    onSaved: (value) => lastName = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'City *',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your City';
                      }
                      return null;
                    },
                    onSaved: (value) => city = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'Pincode*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your pinocde';
                      }
                      return null;
                    },
                    onSaved: (value) => pincode = value,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 20.0), // Adjusts the label's text size
                      //border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      labelText: 'work experience of Caregiver*',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter work experience of Caregiver';
                      }
                      return null;
                    },
                    onSaved: (value) => experience = value,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: Text('Select Photo ID from gallery',
                        style: TextStyle(
                            fontSize: 20.0, color: Colors.white)), // White text
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF25a555), // Navy blue
                      padding: EdgeInsets.all(15),
                    ),
                  ),

                  SizedBox(height: 10),

                  // ... Continue with other form fields

                  // ... Continue with other fields ...

                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit', style: TextStyle(fontSize: 20.0)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF25a555), // Navy blue
                      padding: EdgeInsets.all(15),
                      //    15), // Increased padding to make the button larger
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Send data to server or next step
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Form submitted!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill in all required fields.')));
    }
  }
}

//import 'package:flutter/material.dart';

//void main() {
//  runApp(SeniorCareConnect());
//}

//import 'package:flutter/material.dart';

//void main() => runApp(SeniorCareConnect());
//import 'package:flutter/material.dart';

class CaregiverHomePage extends StatefulWidget {
  @override
  _CaregiverHomePageState createState() => _CaregiverHomePageState();
}

class _CaregiverHomePageState extends State<CaregiverHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            SeniorProfilePage(),
            TasksPage(),
            EmergencyContactPage(),
            ServicesListPage(), // Connecting the ServicesListPage here
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
            icon: Icon(Icons.person),
            label: 'Senior',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Services',
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

// ... [Rest of the previously provided code here]

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final notesController = TextEditingController();
  List<String> notes = []; // List to store notes.

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color:Theme.of(context).primaryColor), // This makes the back button green
        title: Text(
          "Notes",
          style: TextStyle(
              color: Theme.of(context).primaryColor), // Setting the text color to green
        ),
        backgroundColor: Colors.white, // Setting the background color to white
        elevation: 0.0, // Removing the elevation
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(notes[index]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: notesController,
              decoration: InputDecoration(
                hintText: 'Enter a note...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (notesController.text.isNotEmpty) {
                      setState(() {
                        notes.add(notesController.text);
                        notesController.clear();
                      });
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeniorProfilePage extends StatelessWidget {
  final seniorProfile = {
    "fullName": "John Doe",
    "image":
        "https://media.istockphoto.com/id/1029340518/photo/senior-man-smiling-at-home.jpg?s=612x612&w=0&k=20&c=nmP49Ldrx78DHzckvsLfeUf6I0ddyDcQCDjd8siYV9Q=",
    "dateOfBirth": "Jan 1, 1948",
    "age": "75 years",
    "email": "johndoe@email.com",
    "contactNumber": "+123 456 7890",
    "address": "123 Flutter St",
    "city": "Dart City",
    "pincode": "12345",
    "medicalHistory": "History of hypertension, controlled diabetes.",
    "familyMemberName": "Jane Doe",
    "emergencyContactNumber": "+123 987 6543",
    "dietPreferences": "Vegetarian, no lactose, low sodium.",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF25a555)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Senior User Details',
          style: TextStyle(
            fontSize: 26,
            color: Color(0xFF25a555),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF25a555), Colors.green[200]!],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.note, color: Color(0xFF25a555), size: 26.0),
              title: Text(
                'Notes on Senior User',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF25a555),
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NotesPage()));
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.settings, color: Color(0xFF25a555), size: 26.0),
              title: Text(
                'Profile Settings',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF25a555),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CaregiverProfilePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Color(0xFF25a555), size: 26.0),
              title: Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF25a555),
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Log Out"),
                    content: Text("Are you sure you want to log out?"),
                    actions: [
                      TextButton(
                        child: Text("No"),
                        onPressed: () {
                          Navigator.of(context).pop(); // Closes the AlertDialog
                        },
                      ),
                      TextButton(
                        child: Text("Yes"),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => CaregiverLoginPage()),
                          );
                        },
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(seniorProfile["image"] ??
                        "https://fallbackurl.com/default.jpg"),
                    radius: 70,
                  ),
                ),
                SizedBox(height: 30),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildSeniorProfileDetails(seniorProfile)
                          .map((widget) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: widget,
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSeniorProfileDetails(Map<String, String> profile) {
    return profile.entries.where((entry) => entry.key != "image").map((entry) {
      String key = entry.key;
      key = key[0].toUpperCase() +
          key.substring(1); // Capitalize first letter for display
      key = key.replaceAll(RegExp(r'(?<=[a-z])(?=[A-Z])'),
          ' '); // Add space before capital letters for multi-word keys
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$key: ${entry.value}',
              style: TextStyle(fontSize: 20, color: Colors.black)),
          SizedBox(height: 10),
        ],
      );
    }).toList();
  }
}
class CaregiverProfilePage extends StatefulWidget {
  @override
  _CaregiverProfilePageState createState() => _CaregiverProfilePageState();
}

class _CaregiverProfilePageState extends State<CaregiverProfilePage> {
  bool isEditing = false;
  File? _selectedImage;
  Map<String, TextEditingController> controllers = {};


  final caregiverProfile = {
    "fullName": "Melissa Dsouza",
    "image":
        "https://tributehomecare.com/wp-content/uploads/2022/03/Profile-Orana.png",
    "email": "melissadsouza@email.com",
    "contactNumber": "+123 456 7899",
    "address": "203 Herdon Valley",
    "city": "Virginia",
    "pincode": "560064",
    "Occupation": "Primary caregiver for John Doe.",
    "Experience": "5 years experience as a nurse",
  };
   

  @override
  void initState() {
    super.initState();
    caregiverProfile.forEach((key, value) {
      controllers[key] = TextEditingController(text: value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF25a555)),
        title: Text('Caregiver Profile',
            style: TextStyle(color: Color(0xFF25a555))),
        actions: <Widget>[
          IconButton(
            icon: Icon(isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              if (isEditing) {
                // Save the changes here if necessary
                setState(() {
                  caregiverProfile.forEach((key, _) {
                    caregiverProfile[key] = controllers[key]!.text;
                  });
                  isEditing = false;
                });
              } else {
                setState(() {
                  isEditing = true;
                });
              }
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: GestureDetector(
      onTap: isEditing ? _selectImage : null,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 70.0,
            backgroundColor: Theme.of(context).primaryColor,
            backgroundImage: () {
              if (_selectedImage != null && _selectedImage is File) {
                // Use FileImage for the selected image
                return FileImage(_selectedImage!) as ImageProvider<Object>;
              } else {
                // Provide a default image URL with NetworkImage
                return NetworkImage(caregiverProfile["image"] ?? "default_url")
                    as ImageProvider<Object>;
              }
            }(),
          ),
          if (isEditing)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: _selectImage,
                ),
              ),
            ),
        ],
      ),
    ),
                ),
                SizedBox(height: 20),
                _buildProfileDetailWidgets(caregiverProfile),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  void _selectImage() async {
  final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    setState(() {
      _selectedImage = File(pickedFile.path);
    });
  }
}

  Widget _buildProfileDetailWidgets(Map<String, String> profile) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: profile.entries
              .where((entry) => entry.key != "image")
              .map((entry) {
            String key = entry.key;
            key = key[0].toUpperCase() + key.substring(1);
            key = key.replaceAll(RegExp(r'(?<=[a-z])(?=[A-Z])'), ' ');
            return isEditing
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: controllers[entry.key],
                      decoration: InputDecoration(
                        labelText: key,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('$key: ${entry.value}',
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  );
          }).toList(),
        ),
      ),
    );
  }
}


//import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DailySchedulePage();
  }
}

class DailySchedulePage extends StatefulWidget {
  @override
  _DailySchedulePageState createState() => _DailySchedulePageState();
}

class _DailySchedulePageState extends State<DailySchedulePage> {
  late List<Task> tasks;

  @override
  void initState() {
    super.initState();
    tasks = [
      Task(name: "Morning walk", time: "8:00 AM"),
      Task(name: "Medication", time: "9:00 AM"),
      Task(name: "Grocery shopping", time: "11:00 AM"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Tasks',
              style: TextStyle(
                fontSize: 28, // Increased font size
                fontWeight: FontWeight.bold,
                color: Color(0xFF25a555),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return ListTile(
                    title: Text(task.name,
                        style: TextStyle(fontSize: 20)), // Increased font size
                    subtitle: Text(task.time,
                        style: TextStyle(fontSize: 18)), // Increased font size
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskCreationPage(),
            ),
          ).then((newTask) {
            if (newTask != null) {
              setState(() {
                tasks.add(newTask);
              });
            }
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF25a555),
      ),
    );
  }
}

class TaskCreationPage extends StatefulWidget {
  @override
  _TaskCreationPageState createState() => _TaskCreationPageState();
}

class _TaskCreationPageState extends State<TaskCreationPage> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xFF25a555)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Task Details',
                  style: TextStyle(
                    fontSize: 28, // Increased font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: taskNameController,
              decoration: InputDecoration(
                labelText: 'Task Name',
                labelStyle: TextStyle(fontSize: 20), // Increased font size
              ),
              style: TextStyle(fontSize: 18), // Increased font size
            ),
            SizedBox(height: 20),
            TextField(
              controller: taskTimeController,
              decoration: InputDecoration(
                labelText: 'Task Time',
                labelStyle: TextStyle(fontSize: 20), // Increased font size
              ),
              style: TextStyle(fontSize: 18), // Increased font size
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final taskName = taskNameController.text;
                final taskTime = taskTimeController.text;
                if (taskName.isNotEmpty && taskTime.isNotEmpty) {
                  final newTask = Task(name: taskName, time: taskTime);
                  Navigator.pop(context, newTask);
                }
              },
              child: Text('Create Task',
                  style: TextStyle(fontSize: 20)), // Increased font size
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF25a555),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Task {
  final String name;
  final String time;

  Task({required this.name, required this.time});
}

//import 'package:flutter/material.dart';

class EmergencyContactPage extends StatelessWidget {
  final emergencyContact = {
    "fullName": "Jane Doe",
    "image":
        "https://m.media-amazon.com/images/I/81LOG1+k2iL._AC_UF1000,1000_QL80_.jpg",
    "relation": "Daughter",
    "email": "jane.doe@email.com",
    "contactNumber": "+123 456 7890",
    "address": "456 Dart St",
    "city": "Flutter Town",
    "pincode": "54321",
    "otherInfo": "Primary emergency contact for John Doe.",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Emergency Contact',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF25a555),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.inbox,
                      color: Color(0xFF25a555),
                      size: 28,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InboxPage(
                                  contactName: 'Jane Doe',
                                  contactImageURL:
                                      "https://m.media-amazon.com/images/I/81LOG1+k2iL.AC_UF1000,1000_QL80.jpg",
                                )),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(emergencyContact["image"] ??
                      "https://m.media-amazon.com/images/I/81LOG1+k2iL.AC_UF1000,1000_QL80.jpg"),
                  radius: 70,
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildEmergencyContactDetails(emergencyContact)
                        .map((widget) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: widget,
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  List<Widget> _buildEmergencyContactDetails(Map<String, String> profile) {
    return profile.entries.where((entry) => entry.key != "image").map((entry) {
      String key = entry.key;
      key = key[0].toUpperCase() + key.substring(1);
      key = key.replaceAll(RegExp(r'(?<=[a-z])(?=[A-Z])'), ' ');
      return Text(
        '$key: ${entry.value}',
        style: TextStyle(fontSize: 20, color: Colors.black),
      );
    }).toList();
  }
}

class InboxPage extends StatefulWidget {
  final String contactName;
  final String contactImageURL;

  InboxPage({required this.contactName, required this.contactImageURL});

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  TextEditingController _messageController = TextEditingController();
  List<Message> messages = [
    Message(
        content: "Hello, [Patient Name] had breakfast on time today.",
        isFromCaregiver: true),
    Message(
        content: "Medication for [Patient Name] has been given.",
        isFromCaregiver: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Color(0xFF25a555)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'Inbox',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF25a555),
                    ),
                  ),
                  SizedBox(width: 48) // Placeholder for alignment
                ],
              ),
            ),
            // Profile Picture and Name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.contactImageURL),
                    radius: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.contactName,
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF25a555),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Messages
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Bubble(
                    message: messages[index].content,
                    isFromCaregiver: messages[index].isFromCaregiver,
                  );
                },
              ),
            ),
            Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Type a message...',
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Color(0xFF25a555), size: 28),
                    onPressed: () {
                      if (_messageController.text.trim().isNotEmpty) {
                        setState(() {
                          messages.add(Message(
                              content: _messageController.text.trim(),
                              isFromCaregiver: false));
                          _messageController.clear();
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//... (Rest of the classes remain unchanged)

//... (rest of the code remains the same)

// ... Rest of the code (Message and Bubble classes) remains unchanged.

class Message {
  final String content;
  final bool isFromCaregiver;

  Message({required this.content, required this.isFromCaregiver});
}

class Bubble extends StatelessWidget {
  final String message;
  final bool isFromCaregiver;

  Bubble({required this.message, required this.isFromCaregiver});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFromCaregiver ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isFromCaregiver)
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        if (isFromCaregiver)
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7),
            decoration: BoxDecoration(
              color: Color(0xFF25a555),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(30), // Tail like curve
              ),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
      ],
    );
  }
}

class ServicesListPage extends StatefulWidget {
  @override
  _ServicesListPageState createState() => _ServicesListPageState();
}

class _ServicesListPageState extends State<ServicesListPage> {
  List<Service> services = [
    Service(
        title: "Physical Therapy",
        description: "Assistance with exercises and movements"),
    Service(
        title: "Medical Assistance",
        description: "Regular check-ups and medication management"),
    Service(
        title: "Home Cleaning", description: "Keeping the living space tidy"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          children: [
            Text(
              'Services Chosen',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF25a555),
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return ServiceCard(service: service);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {
  final Service service;
  ServiceCard({required this.service});

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.service.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF25a555),
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.service.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}

class Service {
  final String title;
  final String description;

  Service({required this.title, required this.description});
}

// Remember to connect this with the EmergencyContactPage as well.

class ElderlyCareapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeniorCareConnect',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: CaregiverHomePage(),
    );
  }
}

//import 'package:flutter/material.dart';

//void main() => runApp(SeniorCareConnect());

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List<ServiceItem> services = [
//     ServiceItem(
//       title: 'Transportation',
//       description:
//           'Providing safe and timely transport for seniors to appointments, gatherings, and other destinations.',
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFrdQ65Wvc-vBgWICeCXkWC8GZwz6KGKlm1fAi1zudi_cBucWNw9BT-eZtHH2UX5FAIEw&usqp=CAU',
//       price: 13.0,
//     ),
//     ServiceItem(
//       title: 'Home health Care',
//       description:
//           'Comprehensive medical and non-medical care services at the comfort of your home.',
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN70Q7A_sK2P0Fj0LAdWcsDUFODc-YyXqYNmgFUy5xb8h_mZRK6rMrbVBgDB6S6tg9USE&usqp=CAU',
//       price: 12.0,
//     ),
//     ServiceItem(
//       title: 'Social/Recreational activities',
//       description:
//           'Organized activities to keep seniors socially engaged and physically active.',
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqkxiFAliobnfaFpAC7UPoeiUPQQr53fs7zN5Mms9-Qu0T1N0VjZPdbYV7m-YZp11zHE4&usqp=CAU',
//       price: 10.0,
//     ),
//     ServiceItem(
//       title: 'Doctor',
//       description:
//           'Regular check-ups and consultations to ensure senior health is in optimal condition.',
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGs40bI-pJTinUuMECStqpAEDuwhJY2iHabfhawf8XjWDOv8bOYZI5L_fLd7jRfVEPO_0&usqp=CAU',
//       price: 20.0,
//     ),
//     ServiceItem(
//       title: 'Pharmacy',
//       description:
//           'Prompt delivery of prescribed medicines and other pharmacy needs.',
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkLcTOFgXhE1W-HAgdiIpO8-0PsDaoBKlOlI7F5qGXVSi2UxzUCn24jy-Jo1H1OG5KpIc&usqp=CAU',
//       price: 14.0,
//     ),
//     ServiceItem(
//       title: 'Nutrition/Dietary Services',
//       description:
//           'Nutritional planning and diet monitoring to ensure seniors are eating healthily.',
//       imageUrl: 'https://cdn-icons-png.flaticon.com/512/2906/2906325.png',
//       price: 9.0,
//     ),
//     ServiceItem(
//       title: 'Legal services',
//       description:
//           'Standing up for seniors, ensuring their rights are protected and voices are heard.',
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPGXcgCwedh459ZwOYs5FTXYIUdPXjBm9LS2cGlvdMjFlULBEe8T-lKI1p9eVlVPvJMDg&usqp=CAU',
//       price: 20.0,
//     ),
//     //... [Add other services in the same format here]
//   ];

//   bool caregiverWanted = false;
//   Set<String> caregiverServices = {};
//   void _showInitialDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Text(
//             "Please select the desired services. Your choices will be highlighted. Once done, proceed to generate the bill.",
//             textAlign: TextAlign.center,
//           ),
//           actions: <Widget>[
//             ElevatedButton(
//               child: Text("Understood"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showDescriptionDialog(String title, String description) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(title),
//         content: Text(description),
//         actions: <Widget>[
//           TextButton(
//             child: Text("Close"),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//         ],
//       ),
//     );
//   }

//   void toggleServiceSelection(ServiceItem service) {
//     setState(() {
//       service.isSelected = !service.isSelected;
//     });
//   }

//   double calculateTotal() {
//     return services
//         .where((s) => s.isSelected)
//         .fold(0, (sum, service) => sum + (service.price ?? 0.0));
//   }

//   void generateBill() {
//     double total = services
//         .where((s) => s.isSelected)
//         .fold(0, (sum, service) => sum + (service.price ?? 0.0));

//     List<String> selectedServices = services
//         .where((s) => s.isSelected)
//         .map((s) => '${s.title} x1')
//         .toList();

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Bill Summary"),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ...selectedServices.map((s) => Text(s)).toList(),
//             SizedBox(height: 10),
//             Text("\$${total.toStringAsFixed(2)}",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//             SizedBox(height: 10),
//             ElevatedButton(
//               child: Text("Mock Payment"),
//               onPressed: () {
//                 // Mock payment submission
//                 Navigator.of(context).pop();
//                 _showPaymentSuccessDialog();
//               },
//             ),
//           ],
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: Text("Close"),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showPaymentSuccessDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Payment Successful!"),
//         content: Text("Your payment has been received. Thank you!"),
//         actions: <Widget>[
//           TextButton(
//             child: Text("Close"),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _showInitialDialog();
//     });
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           //children: [
//           children: [
//             Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.menu,
//                       color: Color(0xFF25a555)), // Hamburger Icon in navy blue
//                   onPressed: () {
//                     // Open drawer logic
//                   },
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: Text(
//                     'Senior Care Connect',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF25a555), // Text color set to navy blue
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: GridView.builder(
//                 padding: const EdgeInsets.all(10.0),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 0.75,
//                   crossAxisSpacing: 10.0,
//                   mainAxisSpacing: 10.0,
//                 ),
//                 itemCount: services.length,
//                 itemBuilder: (context, index) {
//                   final service = services[index];
//                   return ServiceTile(
//                     service: service,
//                     onTap: () => toggleServiceSelection(service),
//                   );
//                 },
//               ),
//             ),
//             Text(
//               "Total: \$${calculateTotal().toStringAsFixed(2)}",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void _openFeedbackForm(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: Text("Feedback Form"),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextField(
//             decoration: InputDecoration(hintText: 'Enter your feedback'),
//           ),
//         ],
//       ),
//       actions: <Widget>[
//         TextButton(
//           child: Text("Submit"),
//           onPressed: () {
//             Navigator.of(context).pop(); // Mock submission, close the dialog
//           },
//         ),
//         TextButton(
//           child: Text("Cancel"),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ],
//     ),
//   );
// }

// class ServiceItem {
//   final String title;
//   final String description;
//   final String imageUrl;
//   final double? price;
//   bool isSelected = false;

//   ServiceItem({
//     required this.title,
//     required this.description,
//     required this.imageUrl,
//     this.price,
//   });

//   String get fullDescription {
//     return '$description (Price: \$${price ?? 'Not available'})';
//   }
// }

// class ServiceTile extends StatelessWidget {
//   final ServiceItem service;
//   final VoidCallback onTap;

//   ServiceTile({
//     required this.service,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Stack(
//         children: [
//           AspectRatio(
//             aspectRatio: 1, // This ensures the container is a square
//             child: Card(
//               color: service.isSelected ? Colors.green[100] : null,
//               elevation: 3,
//               child: Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Image.network(
//                         service.imageUrl,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Text(
//                       service.title,
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                       textAlign: TextAlign.center,
//                     ),
//                     Text(
//                       'Tap to select/deselect',
//                       style: TextStyle(color: Colors.pink, fontSize: 12),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 8,
//             right: 8,
//             child: IconButton(
//               icon: Icon(Icons.info, color: Color(0xFF25a555)),
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text(service.title),
//                       content: Text(service.fullDescription),
//                       actions: <Widget>[
//                         TextButton(
//                           child: Text("Close"),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         )
//                       ],
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class CaregiverServicePage extends StatefulWidget {
  @override
  _CaregiverServicePageState createState() => _CaregiverServicePageState();
}

class _CaregiverServicePageState extends State<CaregiverServicePage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> selectedServices = [];
  final List<String> availableServices = [
    "Meal Preparation",
    "Medication Assistance",
    "Housekeeping",
    // ... Add other services
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Caregiver Services")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: availableServices.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(availableServices[index]),
                  trailing: ElevatedButton(
                    child: Text("Add"),
                    onPressed: () {
                      if (!selectedServices
                          .contains(availableServices[index])) {
                        setState(() {
                          selectedServices.add(availableServices[index]);
                        });
                        _confirmService(availableServices[index]);
                      }
                    },
                  ),
                );
              },
            ),
          ),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Or type a service...',
              suffixIcon: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    setState(() {
                      selectedServices.add(_controller.text);
                    });
                    _confirmService(_controller.text);
                  }
                },
              ),
            ),
          ),
          ElevatedButton(
            child: Text("Done"),
            onPressed: () {
              Navigator.pop(context, selectedServices);
            },
          )
        ],
      ),
    );
  }

  _confirmService(String service) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add Service"),
        content: Text("Are you sure you want to add $service?"),
        actions: [
          TextButton(
            child: Text("Yes"),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text("No"),
            onPressed: () {
              setState(() {
                selectedServices.remove(service);
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
