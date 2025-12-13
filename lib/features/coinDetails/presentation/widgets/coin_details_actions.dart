import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/data/model/payment_body.dart';
import 'package:flutter/material.dart';

class CoinDetailsActions extends StatelessWidget {
  const CoinDetailsActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade100,
                  foregroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Sell',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.paymentMethod,
                      arguments: PaymentBody(
                        amount: '200',
                        name: 'Abdelrahman',
                        currency: 'USD',
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1E3A8A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Buy',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
