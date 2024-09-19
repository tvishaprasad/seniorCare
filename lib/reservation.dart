import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Gateway Example',
      home: PaymentPage(),
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
            PaymentMethodButton(
              icon: Icons.credit_card, // Card payment icon
              label: 'Credit Card',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardPaymentForm()),
                );
              },
            ),
            PaymentMethodButton(
              icon: Icons.mobile_friendly, // UPI payment icon
              label: 'UPI',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UPIPaymentForm()),
                );
              },
            ),
            PaymentMethodButton(
              icon: Icons.business, // Net Banking icon
              label: 'Net Banking',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NetBankingForm()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  PaymentMethodButton(
      {required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          iconSize: 100,
          onPressed: onPressed,
        ),
        Text(label),
      ],
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Card Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Card Number'),
            ),
            TextField(
              controller: cardHolderController,
              decoration: InputDecoration(labelText: 'Card Holder Name'),
            ),
            TextField(
              controller: cardExpiryController,
              decoration: InputDecoration(labelText: 'Expiry Date (MM/YY)'),
            ),
            TextField(
              controller: cardCVCController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'CVC'),
            ),
            ElevatedButton(
              onPressed: () {
                // Simulate the payment process
                simulatePayment();
              },
              child: Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }

  void simulatePayment() {
    // In a real app, you would integrate with a payment gateway here.
    // For this example, we'll simply show a dialog to simulate the payment.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Payment Confirmation'),
          content: Text('Payment Successful'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
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
      appBar: AppBar(
        title: Text('Enter UPI Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                // Add UPI payment form fields here.
                ),
            ElevatedButton(
              onPressed: () {
                // Implement UPI payment logic.
              },
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
  // Implement the Net Banking form similar to CardPaymentForm.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Net Banking Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                // Add Net Banking form fields here.
                ),
            ElevatedButton(
              onPressed: () {
                // Implement Net Banking logic.
              },
              child: Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }
}