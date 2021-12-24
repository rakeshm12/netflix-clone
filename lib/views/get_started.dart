import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/views/create_account.dart';
import 'package:netflix_ui/widgets/app_bar.dart';
import 'package:netflix_ui/widgets/custom_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Icon(
                    Icons.laptop_chromebook_outlined,
                    size: 40,
                    color: Colors.red.shade900,
                  ),
                  const SizedBox(width: 15),
                  Icon(
                    Icons.desktop_mac,
                    size: 60,
                    color: Colors.red.shade900,
                  ),
                  const SizedBox(width: 15),
                  Icon(
                    Icons.tablet_mac_outlined,
                    size: 35,
                    color: Colors.red.shade900,
                  ),
                  Icon(
                    Icons.phone_iphone,
                    color: Colors.red.shade900,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(text: 'STEP 1 OF 3 \n'),
                  TextSpan(
                      text: 'Set up your account \n \n',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          'Netflix is personalised for you. Use your \nemail and create a password to watch \nNetflix on any device at any time.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          wordSpacing: 3,
                          fontSize: 16,
                          fontStyle: FontStyle.italic)),
                ]),
              ),
            ),
            CustomButton(
                onTap: () => Get.to(const CreateAccount()),
                text: const Text(
                  'CONTINUE',
                  style: TextStyle(fontSize: 16),
                ),
                padding: 30),
          ],
        ));
  }
}
