import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:netflix_ui/views/plan_page.dart';
import 'package:netflix_ui/widgets/app_bar.dart';
import 'package:netflix_ui/widgets/custom_button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(text: 'STEP 1 OF 3 \n'),
                  TextSpan(
                      text:
                          'Enter your email and password \nto start your membership \n \n',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          'Just two more steps and you\'re done! \nWe hate paperwork, too. \n \n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          wordSpacing: 3,
                          fontSize: 16,
                          fontStyle: FontStyle.italic)),
                  TextSpan(
                      text: 'Create your account.',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (_) {
                  if (_emailController.text.isEmpty) {
                    return 'Email is required.';
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(_emailController.text)) {
                    return 'Please enter a valid email address';
                  }
                  return '';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  value = _passwordController.text;
                  if (value.isEmpty) {
                    return 'Password is required.';
                  }
                  if (value.characters.length < 6) {
                    return 'Password should be bw 6 and 60 chars long';
                  }
                  return null;
                },
              ),
            ),
            CustomButton(
                onTap: () {
                  if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
                    return ;
                  } else{
                    Get.to(const PlanPage());
                  }
                },
                text: const Text(
                  'CONTINUE',
                  style: TextStyle(fontSize: 16),
                ),
                padding: 30),
          ],
        ),
      ),
    );
  }
}
