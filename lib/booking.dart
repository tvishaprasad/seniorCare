import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'requestAgainAnimation.dart';
//import 'package:pet_care/pages%20in%20pet%20owner%20homepage/RequestSent.dart';

void main() => runApp(BookingHistoryPage());

class ServiceProvider {
  final String name;
  final String service;
  final String imageUrl;
  final DateTime dateTime;
  int rating; // Add a rating property
  List<Pet> petsServiced; // Add a list of pets serviced

  ServiceProvider({
    required this.name,
    required this.service,
    required this.imageUrl,
    required this.dateTime,
    this.rating = 0, // Set the default rating to 0
    this.petsServiced = const [], // Initialize as an empty list
  });
}

class Pet {
  final String name;
  final String type;

  Pet({required this.name, required this.type});
}

class BookingHistoryPage extends StatefulWidget {
  @override
  _BookingHistoryPageState createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<BookingHistoryPage> {
  final List<ServiceProvider> bookedProviders = [
    ServiceProvider(
      name: "Dr. Johnny Doe",
      service: "Medical Checkup",
      imageUrl: "https://hips.hearstapps.com/hmg-prod/images/portrait-of-a-happy-young-doctor-in-his-clinic-royalty-free-image-1661432441.jpg?crop=0.66698xw:1xh;center,top&resize=1200:*",
      dateTime: DateTime(2023, 4, 12, 10, 0),
    ),
    ServiceProvider(
      name: "Melissa Dsouza",
      service: "Travel Assistance",
      imageUrl: "https://media.licdn.com/dms/image/D5603AQEBsrD1MwQ8ZA/profile-displayphoto-shrink_800_800/0/1678191937888?e=2147483647&v=beta&t=HAbwU8TxPqLgE1d1iAJLrsZpbcBjPLeFtEQymvMuOHY",
      dateTime: DateTime(2023, 4, 13, 11, 0),
    ),
    ServiceProvider(
      name: "Unja Kapoor",
      service: "Vaccination Booking",
      imageUrl: "https://media.licdn.com/dms/image/D5603AQHdnyE7s1W0lQ/profile-displayphoto-shrink_800_800/0/1670212768129?e=2147483647&v=beta&t=3lY5ll-jvWR5dDoG9T0kzXRaSofMVh5mwsJn7Skj-yw",
      dateTime: DateTime(2023, 4, 14, 9, 30),
    ),
    ServiceProvider(
      name: "Dr. John Smith",
      service: "Dentist",
      imageUrl: "https://www.thephysiotherapist.net/wp-content/uploads/2015/05/team1.jpg",
      dateTime: DateTime(2023, 4, 15, 8, 45),
    ),
    ServiceProvider(
      name: "Sarah Connor",
      service: "Cab Booking Assistance",
      imageUrl: "https://www.shutterstock.com/image-photo/cheerful-girl-black-talking-on-260nw-492293842.jpg",
      dateTime: DateTime(2023, 4, 16, 15, 0),
    ),
    ServiceProvider(
      name: "Dr. Robert Langdon",
      service: "Physio Therapy",
      imageUrl: "https://static.wikia.nocookie.net/davincicode/images/a/a7/Robert.jpg/revision/latest/scale-to-width-down/250?cb=20150628141151",
      dateTime: DateTime(2023, 4, 17, 14, 20),
    ),
  ];
  void _onRatingChanged(int index, int newRating) {
    setState(() {
      bookedProviders[index].rating = newRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      debugShowCheckedModeBanner: false, // Set this to false
      home: Scaffold(
        backgroundColor: Colors.white, // Setting background color to white
        appBar: AppBar(
          centerTitle: true, // Centering the title
          title: Padding(
            padding: const EdgeInsets.only(top: 16.0), // Padding at the top
            child: Text(
              "Previous Bookings",
              style: TextStyle(
                color: Color(0xFF25a555),
                fontSize: 22.0,
              ),
            ),
          ),
          backgroundColor: Colors.transparent, // Transparent AppBar
          elevation: 0, // No shadow
        ),
        body: ListView.builder(
          padding: EdgeInsets.only(
              top: 16.0,
              bottom:
                  24.0), // Added top padding to ensure content isn't behind AppBar
          itemCount: bookedProviders.length,
          itemBuilder: (context, index) {
            return BookedProviderTile(
              bookedProvider: bookedProviders[index],
              index: index,
              onRatingChanged: _onRatingChanged,
            );
          },
        ),
      ),
    );
  }
}

class BookedProviderTile extends StatefulWidget {
  final ServiceProvider bookedProvider;
  final int index;
  final Function(int, int) onRatingChanged;

  BookedProviderTile({
    required this.bookedProvider,
    required this.index,
    required this.onRatingChanged,
  });

  @override
  _BookedProviderTileState createState() => _BookedProviderTileState();
}

class _BookedProviderTileState extends State<BookedProviderTile> {
  bool selected = false;
  bool ratingInProgress = false;
  double tileHeight = 100;
  bool showDetails = false;
  bool isButtonPressed = false;
  bool isReportPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (!ratingInProgress) {
            selected = !selected;
            tileHeight = selected ? 225 : 100;
            if (selected) {
              Future.delayed(Duration(milliseconds: 50), () {
                setState(() {
                  showDetails = true;
                });
              });
            } else {
              showDetails = false;
            }
          }
        });
      },
      child: AnimatedContainer(
        height: tileHeight,
        duration: Duration(milliseconds: 70),
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(10),
        child: Container(
          child: Stack(children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 78,
                  height: 78,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    backgroundImage:
                        NetworkImage(widget.bookedProvider.imageUrl),
                  ),
                ),
                SizedBox(width: 15),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.bookedProvider.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Service: ${widget.bookedProvider.service}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Date: ${DateFormat('dd-MM-yyyy HH:mm').format(widget.bookedProvider.dateTime)}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700,
                        fontSize: 16.0,
                      ),
                    ),
                    if (showDetails) ...[
                      SizedBox(height: 6),
                      Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Text('Rating: ',
                                  style: TextStyle(
                                      fontSize:
                                          16.0)), // Increased font size here
                              Row(
                                children: List.generate(5, (index) {
                                  final star = index + 1;
                                  return GestureDetector(
                                    onTap: () {
                                      widget.onRatingChanged(
                                          widget.index, star);
                                      setState(() {
                                        ratingInProgress = true;
                                      });
                                    },
                                    child: Icon(
                                      Icons.star,
                                      size: 20,
                                      color:
                                          star <= widget.bookedProvider.rating
                                              ? Theme.of(context)
                                                  .secondaryHeaderColor
                                              : Colors.grey,
                                    ),
                                  );
                                }),
                              ),
                              if (ratingInProgress)
                                GestureDetector(
                                  onTap: () {
                                    widget.onRatingChanged(widget.index,
                                        widget.bookedProvider.rating);
                                    setState(() {
                                      ratingInProgress = false;
                                    });
                                  },
                                  child: Text(
                                    '\t\t\tSubmit',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                      fontSize:
                                          16.0, // Increased font size here
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ],
                ))
              ],
            ),
            if (showDetails) ...{
              // Show details after the delay
              Positioned(
                bottom: 16.0,
                right: 0,
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isButtonPressed = !isButtonPressed;
                        Future.delayed(Duration(milliseconds: 100), () {
                          setState(() {
                            isButtonPressed = !isButtonPressed;
                            Future.delayed(Duration(milliseconds: 100), () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => RequestAgain(),
                                ),
                              );

                            });
                          });
                        });
                      });
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5.0),
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(160.0, 45.0)),
                    ),
                    child: Text(
                      "Request Again",
                      style: TextStyle(
                        fontSize: 16.0, // Increased font size here
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            },
            if (showDetails) ...{
              // Show details after the delay
              Positioned(
                bottom: 16.0,
                left: 0,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    onPressed: () {
                          setState(() {
                            isReportPressed = !isReportPressed;
                            Future.delayed(Duration(milliseconds: 100), () {
                              _showReportDialog(
                                  context); // Show the report dialog
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (_) => PetSelectionPage(),
                              //   ),
                              // );
                            });
                          });
                        },

                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5.0),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.red,
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(160.0, 45.0)),
                    ),
                    child: Text(
                      "Report",
                      style: TextStyle(
                        fontSize: 16.0, // Increased font size here
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            },
          ]),
        ),
      ),
    );
  }

  void _showReportDialog(BuildContext context) {
    final customTextFieldDecoration = InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(
          color: Theme.of(context).secondaryHeaderColor,
          width: 2.0,
        ),
      ),
      hintText: "Enter your reason here",
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text("Report"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Please enter your reason for reporting:"),
              SizedBox(height: 12),
              TextField(
                decoration: customTextFieldDecoration,
              ),
            ],
          ),
          actions: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                      minimumSize: MaterialStateProperty.all(Size(120.0, 40.0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('Back', style: TextStyle(fontSize: 16)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(
                          Colors.white),
                      minimumSize: MaterialStateProperty.all(Size(120.0, 40.0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Handle confirm button logic here

                      // Close the dialog
                      Navigator.of(context).pop();

                      // Show a Snackbar message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Report successfully submitted'),
                          duration: Duration(
                              seconds: 3), // Adjust the duration as needed
                        ),
                      );
                    },
                    child: Text('Report', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}