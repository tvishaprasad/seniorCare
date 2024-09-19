import 'package:flutter/material.dart';
import 'package:registration/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caregiver Profile',
      theme: myTheme,
      home: CaregiverProfilePage(),
    );
  }
}

class YourProfile extends StatefulWidget {
  @override
  _YourProfile createState() => _YourProfile();
}

class _YourProfile extends State<YourProfile> {
  bool isEditing = false;
  Map<String, TextEditingController> controllers = {};

  final caregiverProfile = {
    "fullName": "John doe",
    "image":
        "https://media.istockphoto.com/id/1029340518/photo/senior-man-smiling-at-home.jpg?s=612x612&w=0&k=20&c=nmP49Ldrx78DHzckvsLfeUf6I0ddyDcQCDjd8siYV9Q=",
    "Username": "johndoe",
    "DOB": "06/07/2003",
    "Email ID": "johndoe@gmail.com",
    "Contact number": "9606229823",
    "Address": "203 Herdon Valley",
    "City": "Virginia",
    "Pincode": "560064",
    "Medical History": "Parkinson's disease, High BP, Thyroid",
    "Family Member Name": "Penny Doe",
    "Emergency Contact Number": "9980518331",
    "Diet Preference": "Breakfast:Bread  Lunch:Rice  Dinner:Millets",
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
        toolbarHeight: 80.0, // Increased toolbar height for padding
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true, // Centering the title
        iconTheme: IconThemeData(color: Color(0xFF25a555)),
        title: Text(
          'Your Profile',
          style: TextStyle(
            color: Color(0xFF25a555),
            fontSize: 24.0, // Increased font size for senior users
          ),
        ),
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
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        caregiverProfile["image"] ?? "default_url"),
                    radius: 70,
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

  Widget _buildProfileDetailWidgets(Map<String, String> profile) {
    return Column(
      children: [
        Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      );
              }).toList(),
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {
            // Show a dialog box when the "Log Out" button is pressed
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                  ),
                  title: Text("Log Out"),
                  content: Text("Are you sure you want to log out?"),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                    TextButton(
                      child: Text(
                        "Log Out",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {
                        // Perform the log out action here
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserTypeSelectionPage()));

                        // Close the dialog
                      },
                    ),
                  ],
                );
              },
            );
          },
          icon: Icon(
              Icons.logout), // You can choose a different logout icon if needed
          label: Text("Log Out"),
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(160, 45)),
            backgroundColor: MaterialStateProperty.all(Colors.red),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
