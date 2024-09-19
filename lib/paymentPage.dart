import 'package:flutter/material.dart';
import 'dart:async'; // Import the dart:async library for Timer
import 'main.dart';
import 'paymentSuccess.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Gateway Example',
      home: PaymentPage(),
      theme: myTheme,
    );
  }
}

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 16.0,
                left: 16.0,
                bottom: 16.0,
                top: 8.0,
              ),
              child: Text(
                'Select Payment Method', // Heading
                style: TextStyle(
                  fontSize: 24, // You can adjust the font size as needed
                  fontWeight: FontWeight.bold, // You can change the font weight
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 16.0,
                left: 16.0,
                bottom: 8.0,
                top: 8.0,
              ),
              child: RoundedCard(
                child: PaymentMethodButton(
                  icon: Icons.credit_card,
                  label: 'Credit Card',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardPaymentForm(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 16.0,
                left: 16.0,
                bottom: 8.0,
                top: 8.0,
              ),
              child: RoundedCard(
                child: PaymentMethodButton(
                  icon: Icons.phone_android_rounded,
                  label: 'UPI',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UPIPaymentForm(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 16.0,
                left: 16.0,
                bottom: 8.0,
                top: 8.0,
              ),
              child: RoundedCard(
                child: PaymentMethodButton(
                  icon: Icons.business,
                  label: 'Net Banking',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NetBankingForm(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedCard extends StatelessWidget {
  final Widget child;

  RoundedCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(20.0), // Adjust the radius as needed
      ),
      elevation: 4,
      child: child,
    );
  }
}

class PaymentMethodButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  PaymentMethodButton(
      {required this.icon, required this.label, required this.onPressed});

  @override
  _PaymentMethodButtonState createState() => _PaymentMethodButtonState();
}

class _PaymentMethodButtonState extends State<PaymentMethodButton> {
  Color _buttonColor = Colors.white; // Initial color
  Timer? _colorChangeTimer; // Timer for color change

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _buttonColor = Theme.of(context).primaryColor; // Change the color to green when pressed
        });
        _colorChangeTimer = Timer(Duration(milliseconds: 60), () {
          widget.onPressed();

          // Schedule a timer to change the color back to its normal color

          setState(() {
            _buttonColor =
                Colors.white; // Change the color back to normal after 1 second
          });
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          color: _buttonColor,
          borderRadius: BorderRadius.circular(20.0), // Rounded borders
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(widget.icon),
              iconSize: 60,
              onPressed: widget.onPressed,
            ),
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 16, // You can adjust the font size as needed
                fontWeight: FontWeight.bold, // You can change the font weight
                color: Colors.grey.shade800, // You can change the text color
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Cancel the timer to avoid memory leaks
    _colorChangeTimer?.cancel();
  }
}

class CardPaymentForm extends StatefulWidget {
  @override
  _CardPaymentFormState createState() => _CardPaymentFormState();
}

class _CardPaymentFormState extends State<CardPaymentForm> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderController = TextEditingController();
  TextEditingController cardExpiryController = TextEditingController();
  TextEditingController cardCVCController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Enter Card Details'),
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: cardNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  labelStyle: TextStyle(color: Colors.grey.shade700),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length < 16) {
                    return 'Card number should have contain at least 16 digits.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: cardHolderController,
                decoration: InputDecoration(
                  labelText: 'Card Holder Name',
                  labelStyle: TextStyle(color: Colors.grey.shade700),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Card holder name is required';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: cardExpiryController,
                decoration: InputDecoration(
                  labelText: 'Expiry Date (MM/YY)',
                  labelStyle: TextStyle(color: Colors.grey.shade700),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty || !isValidExpiryDate(value)) {
                    return 'Invalid expiry date (MM/YY)';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: cardCVCController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'CVC',
                  labelStyle: TextStyle(color: Colors.grey.shade700),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length < 3) {
                    return 'Invalid CVC';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // All fields are valid, proceed with payment
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentSuccess(),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(160, 45)),
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                child: Text('Make Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    final cardNumber = cardNumberController.text;
    final cardHolderName = cardHolderController.text;
    final expiryDate = cardExpiryController.text;
    final cvc = cardCVCController.text;

    if (cardNumber.isEmpty || cardNumber.length < 16) {
      // Card number is invalid (for example, it should be 16 digits)
      return false;
    }

    if (cardHolderName.isEmpty) {
      // Cardholder name is empty
      return false;
    }

    if (expiryDate.isEmpty || !isValidExpiryDate(expiryDate)) {
      // Expiry date is empty or invalid (you can create a custom function to validate it)
      return false;
    }

    if (cvc.isEmpty || cvc.length < 3) {
      // CVC is invalid (for example, it should be 3 digits)
      return false;
    }

    // All fields are valid
    return true;
  }

  bool isValidExpiryDate(String expiryDate) {
    // Implement your custom logic to validate the expiry date format (MM/YY)
    if (expiryDate.length != 5) {
      return false; // Expiry date should be in the format "MM/YY" (5 characters)
    }
    final parts = expiryDate.split('/');
    if (parts.length != 2) {
      return false; // Expiry date should have two parts (month and year)
    }
    final month = int.tryParse(parts[0]);
    final year = int.tryParse(parts[1]);
    if (month == null || year == null) {
      return false; // Month and year should be valid integers
    }
    final currentYear = DateTime.now().year %
        100; // Get the last two digits of the current year
    if (year < currentYear || year > currentYear + 20) {
      return false; // Year should be within a reasonable range (e.g., current year to the next 20 years)
    }
    if (month < 1 || month > 12) {
      return false; // Month should be between 1 and 12
    }
    return true;
  }

  void simulatePayment() {
    // Implement your payment logic here
    print('Payment successful!');
  }
}

class UPIPaymentForm extends StatefulWidget {
  @override
  _UPIPaymentFormState createState() => _UPIPaymentFormState();
}

class _UPIPaymentFormState extends State<UPIPaymentForm> {
  // Implement the UPI payment form similar to CardPaymentForm.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Enter UPI Details'),
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter UPI ID',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          Theme.of(context).primaryColor), // Set the underline color when focused
                ),
                labelStyle: TextStyle(
                    color: Colors.grey.shade800), // Set the default label color
                focusColor: Theme.of(context).primaryColor, // Set the label color when focused
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Simulate the payment process
                // simulatePayment();
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentSuccess(),
                      ),
                    );
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(160, 45)), // Adjust the size as needed
                backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), // Adjust the radius as needed
                  ),
                ),
              ),
              child: Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

class NetBankingForm extends StatefulWidget {
  @override
  _NetBankingFormState createState() => _NetBankingFormState();
}

class _NetBankingFormState extends State<NetBankingForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _accountNumberController = TextEditingController();
  TextEditingController _ifscCodeController = TextEditingController();
  // Implement the Net Banking form similar to CardPaymentForm.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Enter Net Banking Details'),
          backgroundColor: Colors.white,
          foregroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _accountNumberController,
                  decoration: InputDecoration(
                    labelText: 'Account Number',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .green), // Set the underline color when focused
                    ),
                    labelStyle: TextStyle(
                        color: Colors
                            .grey.shade800), // Set the default label color
                    focusColor:
                        Theme.of(context).primaryColor, // Set the label color when focused
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter account number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _ifscCodeController,
                  decoration: InputDecoration(
                    labelText: 'IFSC Code',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .green), // Set the underline color when focused
                    ),
                    labelStyle: TextStyle(
                        color: Colors
                            .grey.shade800), // Set the default label color
                    focusColor:
                        Theme.of(context).primaryColor, // Set the label color when focused
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter IFSC code';
                    }
                    // Add more specific IFSC code validation here
                    if (value.length != 11) {
                      return 'IFSC code should be 11 characters long';
                    }
                    // You can add more checks like regex validation for the IFSC code pattern.
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // The form is valid, you can proceed with the submission logic.
                      // For example, you can call a function to process the payment.
                      // simulatePayment();
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentSuccess(),
                      ),
                    );
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(160, 45)),
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  child: Text('Make Payment'),
                )
              ],
            ),
          ),
        ));
  }
}
