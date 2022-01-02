import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:netflix_ui/views/sign_in.dart';
import 'package:netflix_ui/views/widgets/app_bar.dart';
import 'package:netflix_ui/views/widgets/custom_button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  GlobalKey<FormFieldState> _emailKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> _passwordKey = GlobalKey<FormFieldState>();

  validateOnClick() {
    if (_emailKey.currentState!.validate() || _passwordKey.currentState!.validate()) {
     return;
    } else {
      return;
    }
  }

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
                key: _emailKey,
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
                key: _passwordKey,
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
                  if (_emailController.text.contains(RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")) &&
                      _passwordController.text.characters.length >= 6) {
                    Get.to(const SigninPage());
                  } else {
                    return validateOnClick();
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
