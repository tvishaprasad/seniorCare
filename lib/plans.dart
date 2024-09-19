//import 'main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'main.dart';
import 'paymentPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MembershipPage(),
      theme:myTheme,
    );
  }
}

class MembershipPage extends StatefulWidget {
  @override
  _MembershipPageState createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {
  int _currentIndex = 0;
  final List<MembershipTier> membershipTiers = [
    MembershipTier(title: "Basic Membership", benefits: [
      "Access to emergency helpline",
      "Monthly newsletter",
    ], gradientColors: [
      Colors.blue.shade300.withOpacity(0.2),
      Colors.blue.shade900.withOpacity(0.2),
    ]),
    MembershipTier(title: "Silver Membership", benefits: [
      "Basic Membership benefits",
      "Access to local events",
      "Transportation service",
    ], gradientColors: [
      Colors.grey.shade300.withOpacity(0.3),
      Colors.grey.shade700.withOpacity(0.3),
    ]),
    MembershipTier(title: "Gold Membership", benefits: [
      "Silver Membership benefits",
      "24/7 nurse hotline",
      "Medication reminders",
    ], gradientColors: [
      Colors.amber.shade300.withOpacity(0.3),
      Colors.amber.shade900.withOpacity(0.3),
    ]),
    MembershipTier(title: "Platinum Membership", benefits: [
      "Gold Membership benefits",
      "Personal caregiver",
      "Priority access to services",
    ], gradientColors: [
      Colors.purple.shade300.withOpacity(0.3),
      Colors.purple.shade900.withOpacity(0.3),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 48.0, bottom: 16.0),
              child: Text(
                "Membership Plans",
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Please select the plan:",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 16),
            CarouselSlider(
              items: membershipTiers.map((tier) {
                return MembershipCard(
                  tier: tier,
                );
              }).toList(),
              options: CarouselOptions(
                height: 400.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 10),
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: false, // Disable infinite scroll
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index; // Remove the unnecessary cast here
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            DotsIndicator(
              dotsCount: membershipTiers.length,
              position: _currentIndex,
              decorator: DotsDecorator(
                activeColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MembershipTier {
  final String title;
  final List<String> benefits;
  final List<Color> gradientColors;

  MembershipTier(
      {required this.title,
      required this.benefits,
      required this.gradientColors});
}

class MembershipCard extends StatelessWidget {
  final MembershipTier tier;

  MembershipCard({required this.tier});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentPage()),
          );
        },
        child: Card(
          elevation: 0.0,
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: tier.gradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(30.0), // Rounded border
            ),
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  tier.title,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                Column(
                  children: tier.benefits
                      .map((benefit) => ListTile(
                            title: Text(
                              benefit,
                              style: TextStyle(fontSize: 18),
                            ),
                            leading: Icon(Icons.check_circle),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ));
  }
}
