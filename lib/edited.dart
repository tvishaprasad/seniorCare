import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PaymentPage(),
  ));
}

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentMethod _selectedPaymentMethod = PaymentMethod.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Payment Amount: \$100', style: TextStyle(fontSize: 18)),
            Text('Elderly Care Service: Example Service', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Select Payment Method:', style: TextStyle(fontSize: 18)),
            PaymentOption(
              icon: Icons.credit_card,
              label: 'Card',
              isSelected: _selectedPaymentMethod == PaymentMethod.card,
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = PaymentMethod.card;
                });
              },
            ),
            PaymentOption(
              icon: Icons.account_balance,
              label: 'UPI',
              isSelected: _selectedPaymentMethod == PaymentMethod.upi,
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = PaymentMethod.upi;
                });
              },
            ),
            PaymentOption(
              icon: Icons.account_balance_wallet,
              label: 'Net Banking',
              isSelected: _selectedPaymentMethod == PaymentMethod.netBanking,
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = PaymentMethod.netBanking;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Implement payment processing logic based on _selectedPaymentMethod.
              },
              child: Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

enum PaymentMethod { none, card, upi, netBanking }

class PaymentOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentOption({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 50,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(fontSize: 16, color: isSelected ? Colors.blue : Colors.grey),
          ),
        ],
      ));
    }
  }


class CardPaymentForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Card Payment Form');
  }
}

class UPIPaymentForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('UPI Payment Form');
  }
}

class NetBankingForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Net Banking Form');
  }
}