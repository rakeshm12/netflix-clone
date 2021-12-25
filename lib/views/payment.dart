import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_ui/widgets/app_bar.dart';
import 'package:netflix_ui/widgets/payment_button.dart';

class PaymentSetup extends StatelessWidget {
  const PaymentSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 25,
                foregroundColor: Colors.red.shade900,
                child: const Icon(Icons.lock_rounded, size: 40)),
            const SizedBox(
              height: 15,
            ),
            const Text("STEP 3 OF 3"),
            const Text(
              "Set up your payment",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Your membership starts as soon as you \nset up payment. \n\nNo commitments. Cancel online at \nanytime.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            PaymentButton(
              headText: 'Credit or Debit Card',
              icon: const [
                FaIcon(
                  FontAwesomeIcons.ccVisa,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  width: 2.0,
                ),
                FaIcon(
                  FontAwesomeIcons.ccMastercard,
                  color: Colors.orange,
                  size: 40,
                ),
                SizedBox(
                  width: 2.0,
                ),
                FaIcon(
                  FontAwesomeIcons.ccAmex,
                  size: 40,
                ),
                SizedBox(
                  width: 2.0,
                ),
                FaIcon(
                  FontAwesomeIcons.ccDinersClub,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(width: 80),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 30,
                )
              ],
              onPressed: () {},
            ),
            const SizedBox(height: 20,),
            PaymentButton(
              headText: 'UPI AutoPay',
              icon: const [
                FaIcon(
                  FontAwesomeIcons.amazonPay,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  width: 10.0,
                ),
                FaIcon(
                  FontAwesomeIcons.googlePay,
                  color: Colors.grey,
                  size: 40,
                ),
                SizedBox(width: 160),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 30,
                )
              ],
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
