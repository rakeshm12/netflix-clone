import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/views/plans_page.dart';
import 'package:netflix_ui/widgets/app_bar.dart';
import 'package:netflix_ui/widgets/custom_button.dart';

class ChoosePlan extends StatelessWidget {
  const ChoosePlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLoggedIn,
      body : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.check_circle_outline, size: 40, color: Colors.red.shade900,),
            const SizedBox(height: 15,),
            const Text("STEP 2 OF 3"),
            const Text("Choose your plan.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ListTile(leading: Icon(Icons.check, size: 20, color: Colors.red.shade900,),
            title: const Text('No commitments,cancel anytime.'),),
            ListTile(leading: Icon(Icons.check, size: 20, color: Colors.red.shade900,),
              title: const Text('Everything on Netflix for one low price.'),),
            ListTile(leading: Icon(Icons.check, size: 20, color: Colors.red.shade900,),
              title: const Text('No ads and no extra fees. Ever.'),),
            CustomButton(onTap: () => Get.to(const PlansPage()), text: const Text("SEE THE PLANS", style: TextStyle(fontWeight: FontWeight.bold),), padding: 20)
          ],
        ),
      ),
    );
  }
}
